import type { APIRoute } from 'astro';
import sql from '../../lib/db';

export const prerender = false;

export const GET: APIRoute = async ({ url }) => {
  try {
    const type = url.searchParams.get('type') || 'logo';
    const assets = await sql`SELECT * FROM site_assets WHERE type = ${type} ORDER BY created_at DESC`;
    return new Response(JSON.stringify(assets), { headers: { 'Content-Type': 'application/json' } });
  } catch (error: any) {
    console.error('API assets GET error:', error);
    return new Response(JSON.stringify({ error: error.message }), { status: 500, headers: { 'Content-Type': 'application/json' } });
  }
};

export const POST: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();
    const result = await sql`INSERT INTO site_assets ${sql(body)} RETURNING *`;
    return new Response(JSON.stringify(result[0]), { headers: { 'Content-Type': 'application/json' } });
  } catch (error: any) {
    console.error('API assets POST error:', error);
    return new Response(JSON.stringify({ error: error.message }), { status: 500, headers: { 'Content-Type': 'application/json' } });
  }
};

export const PUT: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();
    const { id, type } = body;
    // First set all of this type to inactive
    if (type) {
      await sql`UPDATE site_assets SET active = false WHERE type = ${type}`;
    }
    // Then set the selected one to active
    const result = await sql`UPDATE site_assets SET active = true WHERE id = ${id} RETURNING *`;
    return new Response(JSON.stringify(result[0]), { headers: { 'Content-Type': 'application/json' } });
  } catch (error: any) {
    console.error('API assets PUT error:', error);
    return new Response(JSON.stringify({ error: error.message }), { status: 500, headers: { 'Content-Type': 'application/json' } });
  }
};

export const DELETE: APIRoute = async ({ request }) => {
  try {
    const { id } = await request.json();
    await sql`DELETE FROM site_assets WHERE id = ${id}`;
    return new Response(JSON.stringify({ success: true }), { headers: { 'Content-Type': 'application/json' } });
  } catch (error: any) {
    console.error('API assets DELETE error:', error);
    return new Response(JSON.stringify({ error: error.message }), { status: 500, headers: { 'Content-Type': 'application/json' } });
  }
};
