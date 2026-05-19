import postgres from 'postgres';

const sql = postgres({
  host: import.meta.env.DB_HOST || 'localhost',
  port: 5432,
  database: import.meta.env.DB_NAME || '',
  username: import.meta.env.DB_USER || '',
  password: import.meta.env.DB_PASSWORD || '',
  ssl: false,
});

export default sql;

// ─── Dedicated Server Plans (admin-managed, stored in DB) ────────────────────

export async function getDedicatedPlans() {
  return await sql`
    SELECT * FROM hosting_plans
    WHERE category = 'DEDICATED'
    ORDER BY sort_order ASC
  `;
}


// ─── Blog Posts ──────────────────────────────────────────────────────────────

interface BlogPostFilters {
  status?: string;
  slug?: string;
  columns?: string;
  limit?: number;
  orderBy?: string;
}

export async function getBlogPosts(filters: BlogPostFilters = {}) {
  const conditions: string[] = ['1=1'];
  const values: any[] = [];
  let i = 1;

  if (filters.status) { conditions.push(`status = $${i++}`); values.push(filters.status); }
  if (filters.slug) { conditions.push(`slug = $${i++}`); values.push(filters.slug); }

  const cols = filters.columns || '*';
  const orderCol = filters.orderBy || 'created_at';
  const limitClause = filters.limit ? `LIMIT ${Number(filters.limit)}` : '';

  // Only allow known order columns
  const allowedOrder = ['created_at', 'published_at', 'updated_at', 'title'];
  const safeOrder = allowedOrder.includes(orderCol) ? orderCol : 'created_at';

  const query = `SELECT ${cols} FROM blog_posts WHERE ${conditions.join(' AND ')} ORDER BY ${safeOrder} DESC ${limitClause}`;

  return await sql.unsafe(query, values);
}

// ─── Site Assets ─────────────────────────────────────────────────────────────

export async function getSiteAssets(type: string) {
  return await sql`
    SELECT * FROM site_assets
    WHERE type = ${type}
    ORDER BY created_at DESC
  `;
}
