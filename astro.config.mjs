// @ts-check
import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';
import react from '@astrojs/react';
import sitemap from '@astrojs/sitemap';

// https://astro.build/config
export default defineConfig({
  site: 'https://qiwhost.com',
  i18n: {
    defaultLocale: 'en',
    locales: ['en', 'es', 'fr', 'de'],
    routing: {
      prefixDefaultLocale: false
    }
  },
  integrations: [tailwind(), react(), sitemap()],
  vite: {
    server: {
      host: true,
      hmr: {
        overlay: false,
        timeout: 600000,
      },
    },
    define: {
      // Ensure environment variables are available in the browser
      'import.meta.env.VITE_SUPABASE_URL': JSON.stringify(process.env.VITE_SUPABASE_URL || 'https://geajgvdqykfijmogcewl.supabase.co'),
      'import.meta.env.VITE_SUPABASE_ANON_KEY': JSON.stringify(process.env.VITE_SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdlYWpndmRxeWtmaWptb2djZXdsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg5MjA5OTMsImV4cCI6MjA2NDQ5Njk5M30.0LpmX10POnzKrRH3o0tCB9UFcg3GL6nrhW-FlNqSTnM'),
    },
  },
});