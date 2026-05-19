/**
 * Build-time API helper.
 * Fetches data from the VPS API server during Astro static build.
 * Used by blog and dedicated-servers pages.
 */

const API_BASE = import.meta.env.API_BASE_URL || 'https://api.qiwhost.com';

export async function fetchBlogPosts() {
  try {
    const res = await fetch(`${API_BASE}/api/blog/build`);
    if (!res.ok) throw new Error(`Blog API failed: ${res.status}`);
    const data = await res.json();
    return data.posts || [];
  } catch (error) {
    console.error('Failed to fetch blog posts:', error);
    return [];
  }
}

export async function fetchDedicatedPlans() {
  try {
    const res = await fetch(`${API_BASE}/api/plans/build`);
    if (!res.ok) throw new Error(`Plans API failed: ${res.status}`);
    const data = await res.json();
    return data.plans || [];
  } catch (error) {
    console.error('Failed to fetch dedicated plans:', error);
    return [];
  }
}
