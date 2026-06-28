-- Admin RPC functions (SECURITY DEFINER bypasses RLS)
-- Run this in Supabase SQL Editor

-- Products
CREATE OR REPLACE FUNCTION admin_insert_product(
  p_name TEXT, p_slug TEXT, p_description TEXT, p_image_url TEXT,
  p_category_id UUID, p_ean TEXT, p_mpn TEXT, p_brand TEXT
) RETURNS UUID SECURITY DEFINER SET search_path = public AS $$
DECLARE
  new_id UUID;
BEGIN
  INSERT INTO products (name, slug, description, image_url, category_id, ean, mpn, brand)
  VALUES (p_name, p_slug, p_description, p_image_url, p_category_id, p_ean, p_mpn, p_brand)
  RETURNING id INTO new_id;
  RETURN new_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION admin_update_product(
  p_id UUID, p_name TEXT, p_slug TEXT, p_description TEXT,
  p_image_url TEXT, p_category_id UUID, p_ean TEXT, p_mpn TEXT, p_brand TEXT
) RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN
  UPDATE products SET
    name = p_name, slug = p_slug, description = p_description,
    image_url = p_image_url, category_id = p_category_id,
    ean = p_ean, mpn = p_mpn, brand = p_brand, updated_at = now()
  WHERE id = p_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION admin_delete_product(p_id UUID)
RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN
  DELETE FROM products WHERE id = p_id;
END;
$$ LANGUAGE plpgsql;

-- Categories
CREATE OR REPLACE FUNCTION admin_insert_category(
  p_name TEXT, p_slug TEXT, p_icon TEXT, p_parent_id UUID DEFAULT NULL
) RETURNS UUID SECURITY DEFINER SET search_path = public AS $$
DECLARE
  new_id UUID;
BEGIN
  INSERT INTO categories (name, slug, icon, parent_id)
  VALUES (p_name, p_slug, p_icon, p_parent_id) RETURNING id INTO new_id;
  RETURN new_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION admin_update_category(
  p_id UUID, p_name TEXT, p_slug TEXT, p_icon TEXT, p_parent_id UUID DEFAULT NULL
) RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN
  UPDATE categories SET name = p_name, slug = p_slug, icon = p_icon, parent_id = p_parent_id
  WHERE id = p_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION admin_delete_category(p_id UUID)
RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN
  DELETE FROM categories WHERE id = p_id;
END;
$$ LANGUAGE plpgsql;

-- Shops
CREATE OR REPLACE FUNCTION admin_insert_shop(
  p_name TEXT, p_slug TEXT, p_logo_url TEXT, p_base_url TEXT
) RETURNS UUID SECURITY DEFINER SET search_path = public AS $$
DECLARE
  new_id UUID;
BEGIN
  INSERT INTO shops (name, slug, logo_url, base_url)
  VALUES (p_name, p_slug, p_logo_url, p_base_url) RETURNING id INTO new_id;
  RETURN new_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION admin_update_shop(
  p_id UUID, p_name TEXT, p_slug TEXT, p_logo_url TEXT,
  p_base_url TEXT, p_is_active BOOLEAN
) RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN
  UPDATE shops SET name = p_name, slug = p_slug, logo_url = p_logo_url,
    base_url = p_base_url, is_active = p_is_active
  WHERE id = p_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION admin_delete_shop(p_id UUID)
RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN
  DELETE FROM shops WHERE id = p_id;
END;
$$ LANGUAGE plpgsql;

-- Product-Shop link
CREATE OR REPLACE FUNCTION admin_upsert_product_shop(
  p_product_id UUID, p_shop_id UUID, p_product_url TEXT, p_sku TEXT, p_in_stock BOOLEAN
) RETURNS UUID SECURITY DEFINER SET search_path = public AS $$
DECLARE
  new_id UUID;
BEGIN
  INSERT INTO product_shops (product_id, shop_id, product_url, sku, in_stock)
  VALUES (p_product_id, p_shop_id, p_product_url, p_sku, p_in_stock)
  ON CONFLICT (product_id, shop_id)
  DO UPDATE SET product_url = p_product_url, sku = p_sku, in_stock = p_in_stock
  RETURNING id INTO new_id;
  RETURN new_id;
END;
$$ LANGUAGE plpgsql;

-- Dashboard stats
CREATE OR REPLACE FUNCTION admin_dashboard_stats()
RETURNS JSONB SECURITY DEFINER SET search_path = public AS $$
DECLARE
  result JSONB;
BEGIN
  SELECT jsonb_build_object(
    'total_products', (SELECT COUNT(*) FROM products),
    'total_shops', (SELECT COUNT(*) FROM shops),
    'total_categories', (SELECT COUNT(*) FROM categories),
    'total_product_shops', (SELECT COUNT(*) FROM product_shops),
    'total_price_records', (SELECT COUNT(*) FROM price_history),
    'recent_products', COALESCE((SELECT jsonb_agg(jsonb_build_object('id', id, 'name', name, 'slug', slug, 'created_at', created_at))
      FROM (SELECT id, name, slug, created_at FROM products ORDER BY created_at DESC LIMIT 5) sub), '[]'::jsonb),
    'shop_stats', COALESCE((SELECT jsonb_agg(jsonb_build_object('name', name, 'count', cnt))
      FROM (SELECT s.name, COUNT(ps.id)::int AS cnt FROM shops s LEFT JOIN product_shops ps ON ps.shop_id = s.id GROUP BY s.id, s.name ORDER BY cnt DESC) sub), '[]'::jsonb)
  ) INTO result;
  RETURN result;
END;
$$ LANGUAGE plpgsql;
