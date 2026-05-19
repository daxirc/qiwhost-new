// @ts-check
import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';
import react from '@astrojs/react';
import sitemap from '@astrojs/sitemap';

import cloudflare from "@astrojs/cloudflare";

// https://astro.build/config
export default defineConfig({
  site: 'https://qiwhost.com',
  output: 'static',

  i18n: {
    defaultLocale: 'en',
    locales: ['en', 'es', 'fr', 'de'],
    routing: {
      prefixDefaultLocale: false
    }
  },

  integrations: [
    tailwind(),
    react(),
    sitemap({
      filter: (page) => !page.includes('/admin'),
    }),
  ],

  adapter: cloudflare()
});