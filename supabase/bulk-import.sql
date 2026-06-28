CREATE OR REPLACE FUNCTION admin_bulk_insert_products(p_products JSONB)
RETURNS JSONB SECURITY DEFINER SET search_path = public AS $$
DECLARE
  p JSONB;
  inserted INT := 0;
  updated INT := 0;
  skipped INT := 0;
  v_slug TEXT;
  v_category_id UUID;
  v_existing_id UUID;
BEGIN
  FOR p IN SELECT * FROM jsonb_array_elements(p_products)
  LOOP
    v_slug := COALESCE(p->>'slug', lower(regexp_replace(p->>'name', '[^a-z0-9]+', '-', 'g')));
    -- Find category by name
    v_category_id := NULL;
    IF p->>'category' IS NOT NULL AND p->>'category' != '' THEN
      SELECT id INTO v_category_id FROM categories WHERE name = p->>'category' LIMIT 1;
    END IF;
    -- Check if exists by EAN or slug
    SELECT id INTO v_existing_id FROM products WHERE slug = v_slug OR (ean IS NOT NULL AND ean = p->>'ean') LIMIT 1;
    IF v_existing_id IS NOT NULL THEN
      UPDATE products SET
        name = COALESCE(p->>'name', name),
        description = COALESCE(p->>'description', description),
        image_url = COALESCE(p->>'image_url', image_url),
        category_id = COALESCE(v_category_id, category_id),
        ean = COALESCE(p->>'ean', ean),
        mpn = COALESCE(p->>'mpn', mpn),
        brand = COALESCE(p->>'brand', brand),
        updated_at = now()
      WHERE id = v_existing_id;
      updated := updated + 1;
    ELSE
      BEGIN
        INSERT INTO products (name, slug, description, image_url, category_id, ean, mpn, brand)
        VALUES (
          p->>'name', v_slug, p->>'description', p->>'image_url',
          v_category_id, p->>'ean', p->>'mpn', p->>'brand'
        );
        inserted := inserted + 1;
      EXCEPTION WHEN unique_violation THEN
        skipped := skipped + 1;
      END;
    END IF;
  END LOOP;
  RETURN jsonb_build_object('inserted', inserted, 'updated', updated, 'skipped', skipped);
END;
$$ LANGUAGE plpgsql;
