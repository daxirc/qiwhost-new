import type { APIRoute } from 'astro';
import sql from '../../lib/db';

export const prerender = false;

export const GET: APIRoute = async ({ url }) => {
  try {
    const status = url.searchParams.get('status');
    let posts;
    if (status) {
      posts = await sql`SELECT * FROM blog_posts WHERE status = ${status} ORDER BY created_at DESC`;
    } else {
      posts = await sql`SELECT * FROM blog_posts ORDER BY created_at DESC`;
    }
    return new Response(JSON.stringify(posts), { headers: { 'Content-Type': 'application/json' } });
  } catch (error: any) {
    console.error('API blog GET error:', error);
    return new Response(JSON.stringify({ error: error.message }), { status: 500, headers: { 'Content-Type': 'application/json' } });
  }
};

export const POST: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();
    const result = await sql`INSERT INTO blog_posts ${sql(body)} RETURNING *`;
    return new Response(JSON.stringify(result[0]), { headers: { 'Content-Type': 'application/json' } });
  } catch (error: any) {
    console.error('API blog POST error:', error);
    return new Response(JSON.stringify({ error: error.message }), { status: 500, headers: { 'Content-Type': 'application/json' } });
  }
};

export const PUT: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();
    const { id, ...data } = body;
    const result = await sql`UPDATE blog_posts SET ${sql(data)}, updated_at = now() WHERE id = ${id} RETURNING *`;
    return new Response(JSON.stringify(result[0]), { headers: { 'Content-Type': 'application/json' } });
  } catch (error: any) {
    console.error('API blog PUT error:', error);
    return new Response(JSON.stringify({ error: error.message }), { status: 500, headers: { 'Content-Type': 'application/json' } });
  }
};

export const DELETE: APIRoute = async ({ request }) => {
  try {
    const { id } = await request.json();
    await sql`DELETE FROM blog_posts WHERE id = ${id}`;
    return new Response(JSON.stringify({ success: true }), { headers: { 'Content-Type': 'application/json' } });
  } catch (error: any) {
    console.error('API blog DELETE error:', error);
    return new Response(JSON.stringify({ error: error.message }), { status: 500, headers: { 'Content-Type': 'application/json' } });
  }
};

export const PATCH: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();
    const { id, status, published_at } = body;
    const result = await sql`UPDATE blog_posts SET status = ${status}, published_at = ${published_at || null}, updated_at = now() WHERE id = ${id} RETURNING *`;
    return new Response(JSON.stringify(result[0]), { headers: { 'Content-Type': 'application/json' } });
  } catch (error: any) {
    console.error('API blog PATCH error:', error);
    return new Response(JSON.stringify({ error: error.message }), { status: 500, headers: { 'Content-Type': 'application/json' } });
  }
};
