import type { APIRoute } from 'astro';

export const prerender = false;

const ADMIN_PASSWORD = import.meta.env.ADMIN_PASSWORD || '';

export const POST: APIRoute = async ({ request }) => {
  try {
    const { email, password } = await request.json();

    if (password === ADMIN_PASSWORD) {
      // Simple token - in production, use a proper JWT
      const token = btoa(`${email}:${Date.now()}`);
      return new Response(JSON.stringify({
        session: { token, user: { email } }
      }), { headers: { 'Content-Type': 'application/json' } });
    }

    return new Response(JSON.stringify({ error: 'Invalid credentials' }), {
      status: 401,
      headers: { 'Content-Type': 'application/json' }
    });
  } catch (error: any) {
    console.error('API auth error:', error);
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' }
    });
  }
};
