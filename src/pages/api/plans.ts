import type { APIRoute } from 'astro';
import sql from '../../lib/db';

export const prerender = false;

export const GET: APIRoute = async ({ url }) => {
  try {
    const category = url.searchParams.get('category');
    const os_type = url.searchParams.get('os_type');
    const region = url.searchParams.get('region');
    const location = url.searchParams.get('location');
    const subcategory = url.searchParams.get('subcategory');
    const flag_icon = url.searchParams.get('flag_icon');
    const flag_icons = url.searchParams.get('flag_icons'); // comma-separated
    const is_linux_featured = url.searchParams.get('is_linux_featured');
    const visible = url.searchParams.get('visible');
    const distinct_field = url.searchParams.get('distinct'); // 'location' or 'flag_icon'

    // Handle distinct queries for filter options
    if (distinct_field) {
      const allowed = ['location', 'flag_icon'];
      if (!allowed.includes(distinct_field)) {
        return new Response(JSON.stringify({ error: 'Invalid distinct field' }), { status: 400, headers: { 'Content-Type': 'application/json' } });
      }
      let result;
      if (distinct_field === 'location') {
        result = await sql`
          SELECT DISTINCT location FROM hosting_plans
          WHERE category = 'VPS' AND visible = true AND location IS NOT NULL
          ORDER BY location ASC
        `;
      } else {
        result = await sql`
          SELECT DISTINCT flag_icon FROM hosting_plans
          WHERE category = 'VPS' AND visible = true AND flag_icon IS NOT NULL
          ORDER BY flag_icon ASC
        `;
      }
      return new Response(JSON.stringify(result), { headers: { 'Content-Type': 'application/json' } });
    }

    const conditions: string[] = ['1=1'];
    const values: any[] = [];
    let i = 1;

    if (category) { conditions.push(`category = $${i++}`); values.push(category); }
    if (os_type) { conditions.push(`os_type = $${i++}`); values.push(os_type); }
    if (visible !== null && visible !== undefined) { conditions.push(`visible = $${i++}`); values.push(visible === 'true'); }
    if (location) { conditions.push(`location = $${i++}`); values.push(location); }
    if (subcategory) { conditions.push(`subcategory = $${i++}`); values.push(subcategory); }
    if (flag_icon) { conditions.push(`flag_icon = $${i++}`); values.push(flag_icon); }
    if (region) { conditions.push(`region = $${i++}`); values.push(region); }
    if (is_linux_featured === 'true') { conditions.push(`is_linux_featured = true`); }

    if (flag_icons) {
      const icons = flag_icons.split(',');
      const placeholders = icons.map(() => `$${i++}`).join(', ');
      conditions.push(`flag_icon IN (${placeholders})`);
      values.push(...icons);
    }

    const query = `SELECT * FROM hosting_plans WHERE ${conditions.join(' AND ')} ORDER BY sort_order ASC`;
    const plans = await sql.unsafe(query, values);

    return new Response(JSON.stringify(plans), { headers: { 'Content-Type': 'application/json' } });
  } catch (error: any) {
    console.error('API plans GET error:', error);
    return new Response(JSON.stringify({ error: error.message }), { status: 500, headers: { 'Content-Type': 'application/json' } });
  }
};

export const POST: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();
    const result = await sql`INSERT INTO hosting_plans ${sql(body)} RETURNING *`;
    return new Response(JSON.stringify(result[0]), { headers: { 'Content-Type': 'application/json' } });
  } catch (error: any) {
    console.error('API plans POST error:', error);
    return new Response(JSON.stringify({ error: error.message }), { status: 500, headers: { 'Content-Type': 'application/json' } });
  }
};

export const PUT: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();
    const { id, ...data } = body;
    const result = await sql`UPDATE hosting_plans SET ${sql(data)}, updated_at = now() WHERE id = ${id} RETURNING *`;
    return new Response(JSON.stringify(result[0]), { headers: { 'Content-Type': 'application/json' } });
  } catch (error: any) {
    console.error('API plans PUT error:', error);
    return new Response(JSON.stringify({ error: error.message }), { status: 500, headers: { 'Content-Type': 'application/json' } });
  }
};

export const DELETE: APIRoute = async ({ request }) => {
  try {
    const { id } = await request.json();
    await sql`DELETE FROM hosting_plans WHERE id = ${id}`;
    return new Response(JSON.stringify({ success: true }), { headers: { 'Content-Type': 'application/json' } });
  } catch (error: any) {
    console.error('API plans DELETE error:', error);
    return new Response(JSON.stringify({ error: error.message }), { status: 500, headers: { 'Content-Type': 'application/json' } });
  }
};

export const PATCH: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();
    const { id, is_linux_featured } = body;
    const result = await sql`UPDATE hosting_plans SET is_linux_featured = ${is_linux_featured} WHERE id = ${id} RETURNING *`;
    return new Response(JSON.stringify(result[0]), { headers: { 'Content-Type': 'application/json' } });
  } catch (error: any) {
    console.error('API plans PATCH error:', error);
    return new Response(JSON.stringify({ error: error.message }), { status: 500, headers: { 'Content-Type': 'application/json' } });
  }
};
