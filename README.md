# QIW Host — qiwhost.com

## Architecture Overview

This project uses a **split architecture**:

| Component | Location | URL |
|---|---|---|
| **Frontend** (this repo) | Cloudflare Pages | `https://qiwhost.com` |
| **Backend API** | VPS Server | `https://api.qiwhost.com` |
| **Database** | VPS Server | PostgreSQL (localhost only) |
| **Admin Panel** | VPS Server | `https://api.qiwhost.com` (via admin routes) |

```
┌─────────────────────────┐        ┌──────────────────────────────┐
│   Cloudflare Pages      │        │   VPS (157.151.208.163)      │
│   (qiwhost.com)         │        │   (api.qiwhost.com)          │
│                         │        │                              │
│   Static HTML/CSS/JS    │───────▶│   Express API (port 4000)    │
│   Built from this repo  │ fetch  │   PostgreSQL (port 5432)     │
│                         │        │   PM2 process manager        │
│   Auto-deploys on push  │        │   OpenLiteSpeed reverse proxy│
└─────────────────────────┘        └──────────────────────────────┘
```

---

## VPS Server Details

| Detail | Value |
|---|---|
| **IP Address** | `157.151.208.163` |
| **OS** | Ubuntu 22.04.5 LTS |
| **Node.js** | v20.20.2 |
| **Web Server** | OpenLiteSpeed (reverse proxy to port 4000) |
| **Process Manager** | PM2 |
| **SSH User** | `ubuntu` |

### SSH Access
```bash
ssh ubuntu@157.151.208.163
```

---

## Database (PostgreSQL)

| Detail | Value |
|---|---|
| **Version** | PostgreSQL 14.22 |
| **Host** | `localhost` (127.0.0.1) — NOT exposed externally |
| **Port** | `5432` |
| **Database** | `qiwhost_db` |
| **User** | `qiwhost` |
| **Password** | Stored in `/var/www/qiwhost-api/.env` on the VPS |

### Important Tables

| Table | Purpose |
|---|---|
| `blog_posts` | All blog articles (12 published posts) |
| `hosting_plans` | Dedicated server plans (2 plans) |
| `site_assets` | Logo and asset management |

### Connect to Database (from VPS only)
```bash
# SSH into the server first, then:
psql -U qiwhost -d qiwhost_db -h localhost

# Or use the connection string from .env:
# DATABASE_URL=postgresql://qiwhost:<password>@localhost:5432/qiwhost_db
```

### Common Database Commands
```sql
-- View all blog posts
SELECT id, title, slug, status, published_at FROM blog_posts ORDER BY published_at DESC;

-- View hosting plans
SELECT id, name, category FROM hosting_plans;

-- Insert a new blog post (use admin panel instead if possible)
INSERT INTO blog_posts (title, slug, content, description, status, category, featured_image, seo_title, seo_description)
VALUES ('Title', 'url-slug', '<p>HTML content</p>', 'Description', 'published', 'tutorials', '/images/blog/image.png', 'SEO Title', 'SEO Description');
```

---

## Backend API Server

| Detail | Value |
|---|---|
| **Location on VPS** | `/var/www/qiwhost-api/` |
| **Entry point** | `src/index.js` |
| **Port** | `4000` (behind OLS reverse proxy) |
| **Public URL** | `https://api.qiwhost.com` |
| **Environment** | `.env` file in `/var/www/qiwhost-api/.env` |

### API Endpoints

| Endpoint | Auth | Purpose |
|---|---|---|
| `GET /health` | No | Health check |
| `GET /api/blog/build` | No | All published posts (used by Cloudflare build) |
| `GET /api/plans/build` | No | Dedicated server plans (used by Cloudflare build) |
| `POST /api/auth` | No | Admin login |
| `GET /api/blog` | Yes | List blog posts (admin) |
| `POST /api/blog` | Yes | Create blog post |
| `PUT /api/blog` | Yes | Update blog post |
| `DELETE /api/blog` | Yes | Delete blog post |
| `GET/POST/PUT/DELETE /api/plans` | Yes | Manage hosting plans |
| `GET/POST/PUT/DELETE /api/assets` | Yes | Manage site assets |
| `POST /api/webhook/rebuild` | Yes | Trigger Cloudflare Pages rebuild |

### Managing the API Server
```bash
# SSH into the server, then:

# Check status
pm2 list

# View logs
pm2 logs qiwhost-api

# Restart
pm2 restart qiwhost-api

# Stop
pm2 stop qiwhost-api

# If you edit code in /var/www/qiwhost-api/:
pm2 restart qiwhost-api
```

---

## Frontend (This Repo — Cloudflare Pages)

### How It Works
1. You push code to `main` branch → Cloudflare Pages auto-builds
2. During build, Astro calls `https://api.qiwhost.com/api/blog/build` to fetch blog posts
3. Static HTML is generated for all pages including blog articles
4. HTML is deployed to Cloudflare's global edge network

### Cloudflare Pages Settings

| Setting | Value |
|---|---|
| **Build command** | `npm run build` |
| **Output directory** | `dist` |
| **Node version** | 22 (auto-detected) |
| **Environment variable** | `API_BASE_URL` = `https://api.qiwhost.com` |

### Key Files

| File | Purpose |
|---|---|
| `src/lib/api.ts` | Fetches data from VPS API at build time |
| `src/data/plans.ts` | Hardcoded VPS/RDP plans (47 locations, 156 plans) |
| `src/pages/blog/[slug].astro` | Blog article pages (generated from API data) |
| `src/pages/blog/index.astro` | Blog listing page |
| `src/pages/dedicated-servers.astro` | Dedicated server plans (from API data) |
| `src/i18n/*.json` | Translations (en, es, fr, de) |

### What Does NOT Need the API
Most pages use hardcoded data and need NO API:
- Homepage, pricing, about, contact, terms, policies
- All VPS location pages (47 locations)
- All RDP pages (5 locations)
- Web hosting pages

### What DOES Need the API
Only these pages fetch from the VPS at build time:
- Blog pages (`/blog/*`) → `fetchBlogPosts()`
- Dedicated servers (`/dedicated-servers`) → `fetchDedicatedPlans()`

---

## How to Update Blog Content

### Option 1: Admin Panel (Recommended)
1. Go to `https://api.qiwhost.com/admin/` (when admin SPA is set up)
2. Login with admin credentials
3. Create/edit/publish blog posts
4. After publishing, trigger a site rebuild

### Option 2: Direct Database
```bash
# SSH into server
ssh ubuntu@157.151.208.163

# Connect to database
psql -U qiwhost -d qiwhost_db -h localhost

# Insert/update posts
# Then trigger a Cloudflare rebuild (push empty commit or use deploy hook)
```

### Triggering a Cloudflare Pages Rebuild
After updating blog content in the database, you need to rebuild the static site:

```bash
# Method 1: Empty git commit (from any machine with repo access)
git commit --allow-empty -m "Rebuild: updated blog content"
git push origin main

# Method 2: Cloudflare Deploy Hook (from VPS)
curl -X POST "https://api.cloudflare.com/client/v4/pages/webhooks/deploy_hooks/YOUR_HOOK_ID"

# Method 3: API webhook (if configured)
curl -X POST https://api.qiwhost.com/api/webhook/rebuild \
  -H "Authorization: Bearer YOUR_TOKEN"
```

---

## Working on This Project from a Different Machine

### 1. Clone the repo
```bash
git clone https://github.com/daxirc/qiwhost-new.git
cd qiwhost-new
npm install
```

### 2. Local development
```bash
# Create .env with API URL (no database needed locally!)
echo "API_BASE_URL=https://api.qiwhost.com" > .env

# Start dev server
npm run dev
```

### 3. Making changes
- Edit frontend files (pages, components, styles)
- Push to `main` → Cloudflare auto-deploys
- **For database/API changes:** SSH into the VPS (`157.151.208.163`)

### 4. Important: What lives WHERE

| Change Type | Where to Make It |
|---|---|
| Page layout, styling, static content | This repo → push to GitHub |
| Blog post content | VPS database → then rebuild CF Pages |
| API logic, new endpoints | VPS `/var/www/qiwhost-api/` → `pm2 restart` |
| VPS/RDP plan data | This repo → `src/data/plans.ts` → push |
| Dedicated server plan data | VPS database → then rebuild CF Pages |
| Environment variables | Cloudflare Pages dashboard or VPS `.env` |

---

## File Structure

```
qiwhost-new/                    ← This repo (Cloudflare Pages)
├── astro.config.mjs            ← Astro config (static output)
├── package.json                ← Frontend dependencies only
├── .env.example                ← Template for environment variables
├── src/
│   ├── lib/api.ts              ← Build-time fetch from VPS API
│   ├── data/plans.ts           ← Hardcoded VPS/RDP plans
│   ├── i18n/                   ← Translations (en, es, fr, de)
│   ├── layouts/                ← Page layouts
│   ├── components/             ← Reusable components
│   └── pages/                  ← All page routes
│       ├── blog/               ← Blog (fetched from API)
│       ├── vps/                ← VPS plans (hardcoded)
│       ├── rdp/                ← RDP plans (hardcoded)
│       ├── dedicated-servers   ← Dedicated (fetched from API)
│       └── ...                 ← Static pages
└── public/                     ← Static assets (images, robots.txt)

/var/www/qiwhost-api/           ← VPS only (not in this repo)
├── .env                        ← DB credentials, API keys
├── src/
│   ├── index.js                ← Express server
│   ├── db.js                   ← PostgreSQL connection
│   ├── middleware/auth.js      ← Token authentication
│   └── routes/
│       ├── auth.js             ← Login endpoint
│       ├── blog.js             ← Blog CRUD + /build
│       ├── plans.js            ← Plans CRUD + /build
│       ├── assets.js           ← Assets CRUD
│       └── webhook.js          ← CF Pages rebuild trigger
```
