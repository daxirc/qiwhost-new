import { createClient } from '@supabase/supabase-js';

// Use environment variables with fallback for production
const supabaseUrl = import.meta.env.VITE_SUPABASE_URL || 'https://geajgvdqykfijmogcewl.supabase.co';
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdlYWpndmRxeWtmaWptb2djZXdsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg5MjA5OTMsImV4cCI6MjA2NDQ5Njk5M30.0LpmX10POnzKrRH3o0tCB9UFcg3GL6nrhW-FlNqSTnM';

console.log('Supabase Config:', {
  url: supabaseUrl,
  hasKey: !!supabaseAnonKey,
  keyLength: supabaseAnonKey?.length
});

if (!supabaseUrl || !supabaseAnonKey) {
  console.error('Missing Supabase environment variables:', {
    url: !!supabaseUrl,
    key: !!supabaseAnonKey
  });
  throw new Error('Missing required Supabase configuration. Check your .env file.');
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey, {
  auth: {
    persistSession: true,
    autoRefreshToken: true,
  },
  db: {
    schema: 'public'
  },
  global: {
    headers: {
      'X-Client-Info': 'qiwhost-admin'
    }
  }
});

// Test connection
supabase.from('hosting_plans').select('count', { count: 'exact', head: true })
  .then(({ count, error }) => {
    if (error) {
      console.error('Supabase connection test failed:', error);
    } else {
      console.log('Supabase connected successfully. Plans count:', count);
    }
  });