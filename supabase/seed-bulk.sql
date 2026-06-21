-- Generated bulk seed for PreisVergleich.ch
-- Paste into Supabase SQL Editor and run

INSERT INTO categories (name, slug) VALUES ('Laptops', 'laptops'), ('Kameras', 'kameras')
ON CONFLICT (slug) DO NOTHING;

DO $$
DECLARE
  cat_smartphones UUID; cat_kopfhorer UUID; cat_gaming UUID;
  cat_smartwatches UUID; cat_tvaudio UUID; cat_haushalt UUID;
  cat_laptops UUID; cat_kameras UUID;
  prod_id UUID; ps_id UUID;
BEGIN
  SELECT id INTO cat_smartphones FROM categories WHERE slug = 'smartphones';
  SELECT id INTO cat_kopfhorer FROM categories WHERE slug = 'kopfhorer';
  SELECT id INTO cat_gaming FROM categories WHERE slug = 'gaming';
  SELECT id INTO cat_smartwatches FROM categories WHERE slug = 'smartwatches';
  SELECT id INTO cat_tvaudio FROM categories WHERE slug = 'tv-audio';
  SELECT id INTO cat_haushalt FROM categories WHERE slug = 'haushalt';
  SELECT id INTO cat_kameras FROM categories WHERE slug = 'kameras';
  SELECT id INTO cat_laptops FROM categories WHERE slug = 'laptops';

  -- SMARTPHONES
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Apple iPhone 17 Pro Max', 'apple-iphone-17-pro-max', 'Apple', 'Apple iPhone 17 Pro Max - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_smartphones, '2898339922716')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Apple%20iPhone%2017%20Pro%20Max', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1356.08, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Apple%20iPhone%2017%20Pro%20Max', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1314.47, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Apple%20iPhone%2017%20Pro%20Max', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1167.56, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Apple%20iPhone%2017%20Pro%20Max', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1288.73, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Apple iPhone 17 Pro', 'apple-iphone-17-pro', 'Apple', 'Apple iPhone 17 Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_smartphones, '2500066950572')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Apple%20iPhone%2017%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1092.19, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Apple%20iPhone%2017%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1211.89, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Apple%20iPhone%2017%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 965.32, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Apple%20iPhone%2017%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1167.73, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Apple%20iPhone%2017%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1158.16, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Apple iPhone 17', 'apple-iphone-17', 'Apple', 'Apple iPhone 17 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_smartphones, '2206497678807')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Apple%20iPhone%2017', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 966.06, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Apple%20iPhone%2017', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 785.19, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Apple%20iPhone%2017', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 810.87, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Apple%20iPhone%2017', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1001.16, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Apple%20iPhone%2017', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 977.94, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Apple iPhone 16 Pro Max', 'apple-iphone-16-pro-max', 'Apple', 'Apple iPhone 16 Pro Max - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_smartphones, '2808940795402')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Apple%20iPhone%2016%20Pro%20Max', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1023.44, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Apple%20iPhone%2016%20Pro%20Max', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1270.3, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Apple%20iPhone%2016%20Pro%20Max', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1354.52, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Apple%20iPhone%2016%20Pro%20Max', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1285.27, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Apple%20iPhone%2016%20Pro%20Max', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1041.06, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Apple%20iPhone%2016%20Pro%20Max', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1337.73, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Apple iPhone 16', 'apple-iphone-16', 'Apple', 'Apple iPhone 16 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_smartphones, '2132235339474')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Apple%20iPhone%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 771.88, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Apple%20iPhone%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 777.49, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Apple%20iPhone%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 695.39, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Apple%20iPhone%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 726.77, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Apple iPhone SE 4', 'apple-iphone-se-4', 'Apple', 'Apple iPhone SE 4 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_smartphones, '2377315721769')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Apple%20iPhone%20SE%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 512.28, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Apple%20iPhone%20SE%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 617.15, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Apple%20iPhone%20SE%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 574.35, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Apple%20iPhone%20SE%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 563.18, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Galaxy S26 Ultra', 'samsung-galaxy-s26-ultra', 'Samsung', 'Samsung Galaxy S26 Ultra - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_smartphones, '2010096451103')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Galaxy%20S26%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1369.52, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Galaxy%20S26%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1094.79, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Galaxy%20S26%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1207.98, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Galaxy%20S26%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1117.16, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Galaxy%20S26%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1189.24, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Galaxy%20S26%20Ultra', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1427.68, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Galaxy S26+', 'samsung-galaxy-s26', 'Samsung', 'Samsung Galaxy S26+ - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_smartphones, '2559981756847')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Galaxy%20S26%2B', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1093.8, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Galaxy%20S26%2B', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 928.23, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Galaxy%20S26%2B', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 893.05, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Galaxy%20S26%2B', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1099.36, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Galaxy S26', 'samsung-galaxy-s26', 'Samsung', 'Samsung Galaxy S26 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_smartphones, '2622189382899')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Galaxy%20S26', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 946.69, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Galaxy%20S26', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 803.69, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Galaxy%20S26', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 939.74, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Galaxy%20S26', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 737.26, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Galaxy%20S26', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 749.24, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Galaxy%20S26', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 886.7, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Galaxy S25', 'samsung-galaxy-s25', 'Samsung', 'Samsung Galaxy S25 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_smartphones, '2661263980195')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Galaxy%20S25', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 681.19, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Galaxy%20S25', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 685.51, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Galaxy%20S25', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 765.86, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Galaxy%20S25', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 664.4, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Galaxy A56', 'samsung-galaxy-a56', 'Samsung', 'Samsung Galaxy A56 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_smartphones, '2647924359489')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Galaxy%20A56', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 351.74, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Galaxy%20A56', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 449.16, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Galaxy%20A56', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 394.95, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Galaxy%20A56', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 455.11, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Galaxy%20A56', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 438.24, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Galaxy%20A56', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 369.67, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Galaxy A36', 'samsung-galaxy-a36', 'Samsung', 'Samsung Galaxy A36 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_smartphones, '2608235111141')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Galaxy%20A36', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 238.07, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Galaxy%20A36', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 265.99, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Galaxy%20A36', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 318.52, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Galaxy%20A36', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 316.41, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Google Pixel 10 Pro', 'google-pixel-10-pro', 'Google', 'Google Pixel 10 Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Google', cat_smartphones, '2731516468774')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Google%20Pixel%2010%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1138.79, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Google%20Pixel%2010%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1053.21, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Google%20Pixel%2010%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 917.46, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Google%20Pixel%2010%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1077.56, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Google Pixel 10', 'google-pixel-10', 'Google', 'Google Pixel 10 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Google', cat_smartphones, '2549729003765')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Google%20Pixel%2010', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 878.94, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Google%20Pixel%2010', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 871.62, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Google%20Pixel%2010', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 881.61, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Google%20Pixel%2010', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 779.36, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Google%20Pixel%2010', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 777.23, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Google%20Pixel%2010', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 843.2, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Xiaomi 15 Ultra', 'xiaomi-15-ultra', 'Xiaomi', 'Xiaomi 15 Ultra - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Xiaomi', cat_smartphones, '2767065533545')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Xiaomi%2015%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1128.68, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Xiaomi%2015%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1051.26, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Xiaomi%2015%20Ultra', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1129.36, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Xiaomi%2015%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1098.52, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Xiaomi%2015%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 968.78, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Xiaomi 15', 'xiaomi-15', 'Xiaomi', 'Xiaomi 15 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Xiaomi', cat_smartphones, '2439770330965')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Xiaomi%2015', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 798.7, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Xiaomi%2015', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 742.4, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Xiaomi Redmi Note 14 Pro', 'xiaomi-redmi-note-14-pro', 'Xiaomi', 'Xiaomi Redmi Note 14 Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Xiaomi', cat_smartphones, '2852603953797')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Xiaomi%20Redmi%20Note%2014%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 398.49, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Xiaomi%20Redmi%20Note%2014%20Pro', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 362.09, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Xiaomi%20Redmi%20Note%2014%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 368.27, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Xiaomi%20Redmi%20Note%2014%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 323.17, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('OnePlus 13', 'oneplus-13', 'OnePlus', 'OnePlus 13 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=OnePlus', cat_smartphones, '2715029176631')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=OnePlus%2013', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 833.59, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=OnePlus%2013', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 981.69, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=OnePlus%2013', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1023.54, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=OnePlus%2013', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 918.91, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=OnePlus%2013', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1005, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Nothing Phone 3', 'nothing-phone-3', 'Nothing', 'Nothing Phone 3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Nothing', cat_smartphones, '2896240026340')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Nothing%20Phone%203', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 654.97, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Nothing%20Phone%203', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 628.7, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Nothing%20Phone%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 656.29, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Nothing%20Phone%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 700.18, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony Xperia 1 VII', 'sony-xperia-1-vii', 'Sony', 'Sony Xperia 1 VII - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_smartphones, '2028569267538')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sony%20Xperia%201%20VII', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1143.4, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sony%20Xperia%201%20VII', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1204.09, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sony%20Xperia%201%20VII', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1255.6, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20Xperia%201%20VII', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1346.59, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sony%20Xperia%201%20VII', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1026.33, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Motorola Edge 50 Pro', 'motorola-edge-50-pro', 'Motorola', 'Motorola Edge 50 Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Motorola', cat_smartphones, '2558181141972')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Motorola%20Edge%2050%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 658.84, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Motorola%20Edge%2050%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 519.71, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Motorola%20Edge%2050%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 609.37, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Motorola%20Edge%2050%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 589.63, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Motorola%20Edge%2050%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 556.61, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Fairphone 5', 'fairphone-5', 'Fairphone', 'Fairphone 5 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Fairphone', cat_smartphones, '2535947347248')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Fairphone%205', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 556.26, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Fairphone%205', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 554.39, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Fairphone%205', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 538.02, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Fairphone%205', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 613.88, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Huawei P80 Pro', 'huawei-p80-pro', 'Huawei', 'Huawei P80 Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Huawei', cat_smartphones, '2434447829760')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Huawei%20P80%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 893.2, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Huawei%20P80%20Pro', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 883.15, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Huawei%20P80%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1053.93, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Huawei%20P80%20Pro', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 909.16, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Huawei%20P80%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1075.87, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Asus Zenfone 12', 'asus-zenfone-12', 'Asus', 'Asus Zenfone 12 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Asus', cat_smartphones, '2139681422847')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Asus%20Zenfone%2012', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 699.35, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Asus%20Zenfone%2012', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 699.33, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Asus%20Zenfone%2012', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 721.27, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Asus%20Zenfone%2012', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 912.49, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Asus%20Zenfone%2012', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 906.07, 'CHF', NOW() - INTERVAL '17 days');

  -- KOPFHORER
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony WH-1000XM6', 'sony-wh-1000xm6', 'Sony', 'Sony WH-1000XM6 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_kopfhorer, '2166405596391')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sony%20WH-1000XM6', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 411.7, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sony%20WH-1000XM6', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 437.64, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sony%20WH-1000XM6', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 431.49, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20WH-1000XM6', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 418.22, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sony%20WH-1000XM6', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 360.38, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony WF-1000XM6', 'sony-wf-1000xm6', 'Sony', 'Sony WF-1000XM6 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_kopfhorer, '2898029260189')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sony%20WF-1000XM6', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 296.78, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sony%20WF-1000XM6', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 320.15, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sony%20WF-1000XM6', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 392.18, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sony%20WF-1000XM6', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 395.46, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20WF-1000XM6', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 356.35, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sony%20WF-1000XM6', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 398, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('AirPods Max 2', 'airpods-max-2', 'Apple', 'AirPods Max 2 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_kopfhorer, '2563887667204')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=AirPods%20Max%202', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 679.61, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=AirPods%20Max%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 678.49, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=AirPods%20Max%202', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 634.32, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=AirPods%20Max%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 572.14, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=AirPods%20Max%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 516.42, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=AirPods%20Max%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 668.9, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('AirPods Pro 3', 'airpods-pro-3', 'Apple', 'AirPods Pro 3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_kopfhorer, '2078711328268')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=AirPods%20Pro%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 301.98, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=AirPods%20Pro%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 291.31, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=AirPods%20Pro%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 295.03, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('AirPods 4', 'airpods-4', 'Apple', 'AirPods 4 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_kopfhorer, '2734412416760')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=AirPods%204', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 162.12, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=AirPods%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 202.31, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=AirPods%204', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 186.3, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=AirPods%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 164.98, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=AirPods%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 171.57, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Bose QuietComfort Ultra', 'bose-quietcomfort-ultra', 'Bose', 'Bose QuietComfort Ultra - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Bose', cat_kopfhorer, '2079210977036')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Bose%20QuietComfort%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 478.26, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Bose%20QuietComfort%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 461.99, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Bose%20QuietComfort%20Ultra', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 445.02, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Bose%20QuietComfort%20Ultra', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 418.58, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Bose%20QuietComfort%20Ultra', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 499.04, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Bose%20QuietComfort%20Ultra', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 407.12, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Bose QC Ultra Earbuds', 'bose-qc-ultra-earbuds', 'Bose', 'Bose QC Ultra Earbuds - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Bose', cat_kopfhorer, '2640769828224')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Bose%20QC%20Ultra%20Earbuds', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 392.6, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Bose%20QC%20Ultra%20Earbuds', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 371.67, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Bose%20QC%20Ultra%20Earbuds', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 378.52, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sennheiser Momentum 5', 'sennheiser-momentum-5', 'Sennheiser', 'Sennheiser Momentum 5 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sennheiser', cat_kopfhorer, '2097566259617')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sennheiser%20Momentum%205', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 565.89, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sennheiser%20Momentum%205', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 497.12, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sennheiser%20Momentum%205', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 467.36, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sennheiser%20Momentum%205', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 508.33, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sennheiser%20Momentum%205', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 494.67, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sennheiser Momentum TW 5', 'sennheiser-momentum-tw-5', 'Sennheiser', 'Sennheiser Momentum TW 5 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sennheiser', cat_kopfhorer, '2364022003714')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sennheiser%20Momentum%20TW%205', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 311.56, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sennheiser%20Momentum%20TW%205', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 327.69, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sennheiser%20Momentum%20TW%205', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 342.55, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sennheiser%20Momentum%20TW%205', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 366.84, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sennheiser%20Momentum%20TW%205', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 370.99, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Beats Studio Pro', 'beats-studio-pro', 'Beats', 'Beats Studio Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Beats', cat_kopfhorer, '2484477941852')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Beats%20Studio%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 448.32, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Beats%20Studio%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 442.96, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Beats%20Studio%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 357.75, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Jabra Elite 10 Gen 2', 'jabra-elite-10-gen-2', 'Jabra', 'Jabra Elite 10 Gen 2 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Jabra', cat_kopfhorer, '2161290859870')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Jabra%20Elite%2010%20Gen%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 316.95, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Jabra%20Elite%2010%20Gen%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 261.07, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Jabra%20Elite%2010%20Gen%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 320.57, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Jabra%20Elite%2010%20Gen%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 301.41, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Jabra%20Elite%2010%20Gen%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 296.19, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Jabra%20Elite%2010%20Gen%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 304.52, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Marshall Monitor III', 'marshall-monitor-iii', 'Marshall', 'Marshall Monitor III - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Marshall', cat_kopfhorer, '2339180766302')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Marshall%20Monitor%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 337.1, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Marshall%20Monitor%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 361.76, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Marshall%20Monitor%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 389.63, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Marshall%20Monitor%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 303.42, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Marshall%20Monitor%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 350.03, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Nothing Ear 4', 'nothing-ear-4', 'Nothing', 'Nothing Ear 4 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Nothing', cat_kopfhorer, '2517543114591')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Nothing%20Ear%204', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 170.57, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Nothing%20Ear%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 164.12, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Nothing%20Ear%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 142.47, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Nothing%20Ear%204', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 130.39, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Nothing%20Ear%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 142.01, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('JBL Tune 770NC', 'jbl-tune-770nc', 'JBL', 'JBL Tune 770NC - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=JBL', cat_kopfhorer, '2777398045338')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=JBL%20Tune%20770NC', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 120.45, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=JBL%20Tune%20770NC', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 120.77, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=JBL%20Tune%20770NC', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 141.14, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=JBL%20Tune%20770NC', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 112.82, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=JBL%20Tune%20770NC', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 110.64, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=JBL%20Tune%20770NC', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 113.2, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Shure Aonic 50 Gen 2', 'shure-aonic-50-gen-2', 'Shure', 'Shure Aonic 50 Gen 2 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Shure', cat_kopfhorer, '2718074181603')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Shure%20Aonic%2050%20Gen%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 572.42, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Shure%20Aonic%2050%20Gen%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 527.84, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Shure%20Aonic%2050%20Gen%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 568.69, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Shure%20Aonic%2050%20Gen%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 432.34, 'CHF', NOW() - INTERVAL '24 days');

  -- GAMING
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony PlayStation 6', 'sony-playstation-6', 'Sony', 'Sony PlayStation 6 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_gaming, '2328622245561')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sony%20PlayStation%206', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 655.07, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sony%20PlayStation%206', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 644.89, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sony%20PlayStation%206', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 566.85, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sony%20PlayStation%206', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 611.91, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20PlayStation%206', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 683.48, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sony%20PlayStation%206', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 668.74, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony PS6 DualSense 2', 'sony-ps6-dualsense-2', 'Sony', 'Sony PS6 DualSense 2 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_gaming, '2820268896507')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sony%20PS6%20DualSense%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 82.12, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sony%20PS6%20DualSense%202', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 68.49, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sony%20PS6%20DualSense%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 75.35, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20PS6%20DualSense%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 67.34, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sony%20PS6%20DualSense%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 67.19, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Nintendo Switch OLED', 'nintendo-switch-oled', 'Nintendo', 'Nintendo Switch OLED - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Nintendo', cat_gaming, '2328138402669')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Nintendo%20Switch%20OLED', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 332.41, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Nintendo%20Switch%20OLED', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 323.52, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Nintendo%20Switch%20OLED', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 336.28, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Nintendo%20Switch%20OLED', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 327.78, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Xbox Series X 2TB', 'xbox-series-x-2tb', 'Microsoft', 'Xbox Series X 2TB - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Microsoft', cat_gaming, '2813105738905')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Xbox%20Series%20X%202TB', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 576.27, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Xbox%20Series%20X%202TB', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 478.77, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Xbox%20Series%20X%202TB', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 594.4, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Xbox%20Series%20X%202TB', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 549.28, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Xbox%20Series%20X%202TB', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 579.3, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Xbox Series S 1TB', 'xbox-series-s-1tb', 'Microsoft', 'Xbox Series S 1TB - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Microsoft', cat_gaming, '2476400625876')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Xbox%20Series%20S%201TB', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 381.33, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Xbox%20Series%20S%201TB', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 350.54, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Xbox%20Series%20S%201TB', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 347.02, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Xbox%20Series%20S%201TB', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 378.11, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Asus ROG Ally X', 'asus-rog-ally-x', 'Asus', 'Asus ROG Ally X - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Asus', cat_gaming, '2839257782934')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Asus%20ROG%20Ally%20X', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 896.19, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Asus%20ROG%20Ally%20X', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 791.26, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Asus%20ROG%20Ally%20X', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 869.76, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Asus%20ROG%20Ally%20X', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 826.12, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Asus%20ROG%20Ally%20X', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 764.73, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Asus%20ROG%20Ally%20X', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 944.34, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Steam Deck OLED', 'steam-deck-oled', 'Valve', 'Steam Deck OLED - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Valve', cat_gaming, '2215326051742')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Steam%20Deck%20OLED', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 609.79, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Steam%20Deck%20OLED', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 687.64, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Steam%20Deck%20OLED', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 578.6, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Steam%20Deck%20OLED', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 599.76, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Logitech G Pro X Superlight 2', 'logitech-g-pro-x-superlight-2', 'Logitech', 'Logitech G Pro X Superlight 2 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Logitech', cat_gaming, '2115593529228')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Logitech%20G%20Pro%20X%20Superlight%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 139.33, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Logitech%20G%20Pro%20X%20Superlight%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 126.05, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Logitech%20G%20Pro%20X%20Superlight%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 153.42, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Logitech%20G%20Pro%20X%20Superlight%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 143.82, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Logitech%20G%20Pro%20X%20Superlight%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 128.35, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Logitech%20G%20Pro%20X%20Superlight%202', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 143.35, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Razer DeathAdder V4 Pro', 'razer-deathadder-v4-pro', 'Razer', 'Razer DeathAdder V4 Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Razer', cat_gaming, '2646587057820')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Razer%20DeathAdder%20V4%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 139.52, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Razer%20DeathAdder%20V4%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 142.24, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Razer%20DeathAdder%20V4%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 130.49, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Razer%20DeathAdder%20V4%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 156.65, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Corsair K70 Max', 'corsair-k70-max', 'Corsair', 'Corsair K70 Max - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Corsair', cat_gaming, '2413990508808')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Corsair%20K70%20Max', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 249.81, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Corsair%20K70%20Max', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 251.27, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('HyperX Cloud Alpha Wireless', 'hyperx-cloud-alpha-wireless', 'HyperX', 'HyperX Cloud Alpha Wireless - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=HyperX', cat_gaming, '2483686955963')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=HyperX%20Cloud%20Alpha%20Wireless', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 194.83, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=HyperX%20Cloud%20Alpha%20Wireless', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 158.86, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=HyperX%20Cloud%20Alpha%20Wireless', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 167.81, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Razer Kraken V4 Pro', 'razer-kraken-v4-pro', 'Razer', 'Razer Kraken V4 Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Razer', cat_gaming, '2875624179240')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Razer%20Kraken%20V4%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 174.34, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Razer%20Kraken%20V4%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 191.18, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Razer%20Kraken%20V4%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 207.63, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Razer%20Kraken%20V4%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 223.19, 'CHF', NOW() - INTERVAL '11 days');

  -- SMARTWATCHES
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Apple Watch Ultra 3', 'apple-watch-ultra-3', 'Apple', 'Apple Watch Ultra 3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_smartwatches, '2331849797048')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Apple%20Watch%20Ultra%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 800.16, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Apple%20Watch%20Ultra%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 912.59, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Apple%20Watch%20Ultra%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 931.95, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Apple%20Watch%20Ultra%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 872.92, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Apple%20Watch%20Ultra%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 761.26, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Apple%20Watch%20Ultra%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 960.87, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Apple Watch Series 11', 'apple-watch-series-11', 'Apple', 'Apple Watch Series 11 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_smartwatches, '2451621553824')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Apple%20Watch%20Series%2011', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 509.47, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Apple%20Watch%20Series%2011', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 484.63, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Apple%20Watch%20Series%2011', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 531.16, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Apple%20Watch%20Series%2011', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 454.32, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Apple%20Watch%20Series%2011', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 540.02, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Apple Watch SE 3', 'apple-watch-se-3', 'Apple', 'Apple Watch SE 3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_smartwatches, '2188458098721')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Apple%20Watch%20SE%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 314.08, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Apple%20Watch%20SE%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 278.42, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Apple%20Watch%20SE%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 267.3, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Apple%20Watch%20SE%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 343.82, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Apple%20Watch%20SE%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 267.74, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Galaxy Watch 8', 'samsung-galaxy-watch-8', 'Samsung', 'Samsung Galaxy Watch 8 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_smartwatches, '2412284479945')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Galaxy%20Watch%208', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 474.78, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Galaxy%20Watch%208', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 436.01, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Galaxy%20Watch%208', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 406.37, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Galaxy%20Watch%208', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 480.3, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Galaxy%20Watch%208', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 444.25, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Galaxy%20Watch%208', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 382.31, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Galaxy Watch 8 Classic', 'samsung-galaxy-watch-8-classic', 'Samsung', 'Samsung Galaxy Watch 8 Classic - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_smartwatches, '2484962197580')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Galaxy%20Watch%208%20Classic', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 428.25, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Galaxy%20Watch%208%20Classic', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 434.83, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Galaxy%20Watch%208%20Classic', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 502.81, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Galaxy%20Watch%208%20Classic', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 562.35, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Garmin Fenix 8', 'garmin-fenix-8', 'Garmin', 'Garmin Fenix 8 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Garmin', cat_smartwatches, '2090684067888')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Garmin%20Fenix%208', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 860.65, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Garmin%20Fenix%208', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 891.34, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Garmin%20Fenix%208', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 864.26, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Garmin%20Fenix%208', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 767.42, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Garmin%20Fenix%208', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 973.15, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Garmin%20Fenix%208', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 825.46, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Garmin Forerunner 265', 'garmin-forerunner-265', 'Garmin', 'Garmin Forerunner 265 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Garmin', cat_smartwatches, '2832877533786')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Garmin%20Forerunner%20265', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 424.86, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Garmin%20Forerunner%20265', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 557.58, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Garmin%20Forerunner%20265', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 529.84, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Garmin Venu 4', 'garmin-venu-4', 'Garmin', 'Garmin Venu 4 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Garmin', cat_smartwatches, '2228042685079')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Garmin%20Venu%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 388.05, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Garmin%20Venu%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 438.84, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Garmin%20Venu%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 354.67, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Google Pixel Watch 4', 'google-pixel-watch-4', 'Google', 'Google Pixel Watch 4 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Google', cat_smartwatches, '2086061876280')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Google%20Pixel%20Watch%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 403.57, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Google%20Pixel%20Watch%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 419.45, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Google%20Pixel%20Watch%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 424.47, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Google%20Pixel%20Watch%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 431.31, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Google%20Pixel%20Watch%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 372.58, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Google%20Pixel%20Watch%204', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 374.38, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Google Pixel Watch 4 Pro', 'google-pixel-watch-4-pro', 'Google', 'Google Pixel Watch 4 Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Google', cat_smartwatches, '2126220517255')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Google%20Pixel%20Watch%204%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 529.51, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Google%20Pixel%20Watch%204%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 525.41, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Withings ScanWatch Nova', 'withings-scanwatch-nova', 'Withings', 'Withings ScanWatch Nova - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Withings', cat_smartwatches, '2636951668471')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Withings%20ScanWatch%20Nova', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 536.88, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Withings%20ScanWatch%20Nova', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 584.36, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Withings%20ScanWatch%20Nova', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 562.37, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Withings%20ScanWatch%20Nova', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 537.41, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Withings%20ScanWatch%20Nova', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 578.54, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Huawei Watch GT 6', 'huawei-watch-gt-6', 'Huawei', 'Huawei Watch GT 6 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Huawei', cat_smartwatches, '2664835574402')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Huawei%20Watch%20GT%206', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 338.76, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Huawei%20Watch%20GT%206', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 336.57, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Huawei%20Watch%20GT%206', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 319.2, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Huawei%20Watch%20GT%206', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 357.27, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Fitbit Charge 7', 'fitbit-charge-7', 'Fitbit', 'Fitbit Charge 7 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Fitbit', cat_smartwatches, '2574594689733')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Fitbit%20Charge%207', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 158.11, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Fitbit%20Charge%207', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 202.96, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Fitbit%20Charge%207', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 184.33, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Fitbit%20Charge%207', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 168.38, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Fitbit%20Charge%207', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 157.36, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Amazfit T-Rex 4', 'amazfit-t-rex-4', 'Amazfit', 'Amazfit T-Rex 4 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Amazfit', cat_smartwatches, '2404131244275')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Amazfit%20T-Rex%204', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 221.63, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Amazfit%20T-Rex%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 187.46, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Amazfit%20T-Rex%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 172.37, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Amazfit%20T-Rex%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 193.3, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Amazfit%20T-Rex%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 191.26, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Amazfit%20T-Rex%204', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 208.42, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('OnePlus Watch 3', 'oneplus-watch-3', 'OnePlus', 'OnePlus Watch 3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=OnePlus', cat_smartwatches, '2832726331701')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=OnePlus%20Watch%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 311.68, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=OnePlus%20Watch%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 318.19, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=OnePlus%20Watch%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 317.88, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=OnePlus%20Watch%203', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 298.59, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=OnePlus%20Watch%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 343.5, 'CHF', NOW() - INTERVAL '10 days');

  -- TV-AUDIO
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung OLED S95F 65"', 'samsung-oled-s95f-65', 'Samsung', 'Samsung OLED S95F 65" - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_tvaudio, '2444269315116')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20OLED%20S95F%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2198.82, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20OLED%20S95F%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2192.05, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20OLED%20S95F%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2353.05, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20OLED%20S95F%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2573.02, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Neo QLED QN90F 65"', 'samsung-neo-qled-qn90f-65', 'Samsung', 'Samsung Neo QLED QN90F 65" - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_tvaudio, '2262567662816')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Neo%20QLED%20QN90F%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1560, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Neo%20QLED%20QN90F%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1630.5, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Neo%20QLED%20QN90F%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1612.51, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Neo%20QLED%20QN90F%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1735.62, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Neo QLED QN90F 55"', 'samsung-neo-qled-qn90f-55', 'Samsung', 'Samsung Neo QLED QN90F 55" - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_tvaudio, '2631776654260')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Neo%20QLED%20QN90F%2055%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1156.1, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Neo%20QLED%20QN90F%2055%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1217.85, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Neo%20QLED%20QN90F%2055%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1172.6, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Neo%20QLED%20QN90F%2055%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1482.42, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Neo%20QLED%20QN90F%2055%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1327.44, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Neo%20QLED%20QN90F%2055%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1109.84, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('LG G5 OLED 65"', 'lg-g5-oled-65', 'LG', 'LG G5 OLED 65" - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=LG', cat_tvaudio, '2425665473123')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=LG%20G5%20OLED%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2504.83, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=LG%20G5%20OLED%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3089.97, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=LG%20G5%20OLED%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2922.05, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=LG%20G5%20OLED%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3101.32, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=LG%20G5%20OLED%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2765.65, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=LG%20G5%20OLED%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2877.13, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('LG C5 OLED 65"', 'lg-c5-oled-65', 'LG', 'LG C5 OLED 65" - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=LG', cat_tvaudio, '2100961438885')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=LG%20C5%20OLED%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1827.68, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=LG%20C5%20OLED%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2288.32, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=LG%20C5%20OLED%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1811.3, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=LG%20C5%20OLED%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2000.87, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=LG%20C5%20OLED%2065%22', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1952.17, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('LG C5 OLED 55"', 'lg-c5-oled-55', 'LG', 'LG C5 OLED 55" - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=LG', cat_tvaudio, '2590941466458')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=LG%20C5%20OLED%2055%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1584.59, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=LG%20C5%20OLED%2055%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1539.13, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=LG%20C5%20OLED%2055%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1511.32, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=LG%20C5%20OLED%2055%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1415.89, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=LG%20C5%20OLED%2055%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1691.49, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=LG%20C5%20OLED%2055%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1600.03, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony Bravia 9 65"', 'sony-bravia-9-65', 'Sony', 'Sony Bravia 9 65" - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_tvaudio, '2680575330937')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sony%20Bravia%209%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2569.11, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sony%20Bravia%209%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2013.73, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sony%20Bravia%209%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2371.01, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20Bravia%209%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2226.91, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sony%20Bravia%209%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2547.23, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony Bravia 8 OLED 65"', 'sony-bravia-8-oled-65', 'Sony', 'Sony Bravia 8 OLED 65" - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_tvaudio, '2711605420792')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sony%20Bravia%208%20OLED%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1937.64, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sony%20Bravia%208%20OLED%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2125.38, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sony%20Bravia%208%20OLED%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2101.27, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sony%20Bravia%208%20OLED%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2097.83, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Panasonic Z95C OLED 65"', 'panasonic-z95c-oled-65', 'Panasonic', 'Panasonic Z95C OLED 65" - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Panasonic', cat_tvaudio, '2780045393721')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Panasonic%20Z95C%20OLED%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2818.67, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Panasonic%20Z95C%20OLED%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3088.88, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Panasonic%20Z95C%20OLED%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2478.86, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Panasonic%20Z95C%20OLED%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2782.29, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Panasonic%20Z95C%20OLED%2065%22', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2784.14, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Soundbar HW-Q990F', 'samsung-soundbar-hw-q990f', 'Samsung', 'Samsung Soundbar HW-Q990F - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_tvaudio, '2864459890782')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Soundbar%20HW-Q990F', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1377.44, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Soundbar%20HW-Q990F', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1342.24, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Soundbar%20HW-Q990F', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1632.84, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Soundbar%20HW-Q990F', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1404.88, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Soundbar%20HW-Q990F', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1304.1, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Soundbar%20HW-Q990F', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1626.35, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Soundbar HW-Q800F', 'samsung-soundbar-hw-q800f', 'Samsung', 'Samsung Soundbar HW-Q800F - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_tvaudio, '2655992220227')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Soundbar%20HW-Q800F', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 872.96, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Soundbar%20HW-Q800F', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 773.66, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Soundbar%20HW-Q800F', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 730.58, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Soundbar%20HW-Q800F', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 732.17, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Soundbar%20HW-Q800F', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 822.21, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sonos Arc Ultra', 'sonos-arc-ultra', 'Sonos', 'Sonos Arc Ultra - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sonos', cat_tvaudio, '2636970825131')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sonos%20Arc%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1113.97, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sonos%20Arc%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 995.23, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sonos%20Arc%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1121.7, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sonos%20Arc%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1030.91, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sonos%20Arc%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 903.98, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sonos%20Arc%20Ultra', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1107.54, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sonos Beam Gen 3', 'sonos-beam-gen-3', 'Sonos', 'Sonos Beam Gen 3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sonos', cat_tvaudio, '2754454056638')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sonos%20Beam%20Gen%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 467.25, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sonos%20Beam%20Gen%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 540.08, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sonos%20Beam%20Gen%203', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 505.27, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sonos Era 300', 'sonos-era-300', 'Sonos', 'Sonos Era 300 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sonos', cat_tvaudio, '2770776584255')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sonos%20Era%20300', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 493.35, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sonos%20Era%20300', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 446.06, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sonos%20Era%20300', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 540.55, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sonos%20Era%20300', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 454.55, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sonos%20Era%20300', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 437.65, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sonos Era 100', 'sonos-era-100', 'Sonos', 'Sonos Era 100 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sonos', cat_tvaudio, '2290969285897')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sonos%20Era%20100', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 281.85, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sonos%20Era%20100', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 286.63, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sonos%20Era%20100', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 262.53, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sonos%20Era%20100', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 317.87, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sonos%20Era%20100', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 255.32, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sonos%20Era%20100', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 308.21, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Marshall Stanmore III', 'marshall-stanmore-iii', 'Marshall', 'Marshall Stanmore III - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Marshall', cat_tvaudio, '2397563855463')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Marshall%20Stanmore%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 330.29, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Marshall%20Stanmore%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 367.34, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Marshall%20Stanmore%20III', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 424.35, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Marshall%20Stanmore%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 400.16, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Marshall%20Stanmore%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 418.44, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Marshall Woburn III', 'marshall-woburn-iii', 'Marshall', 'Marshall Woburn III - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Marshall', cat_tvaudio, '2382899849798')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Marshall%20Woburn%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 589.08, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Marshall%20Woburn%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 533.75, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Marshall%20Woburn%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 467.17, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Marshall%20Woburn%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 581.94, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('JBL PartyBox 320', 'jbl-partybox-320', 'JBL', 'JBL PartyBox 320 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=JBL', cat_tvaudio, '2514864685310')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=JBL%20PartyBox%20320', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 450.31, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=JBL%20PartyBox%20320', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 378.07, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=JBL%20PartyBox%20320', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 408.84, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=JBL%20PartyBox%20320', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 367.14, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=JBL%20PartyBox%20320', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 362.28, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=JBL%20PartyBox%20320', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 399.45, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Apple HomePod 3', 'apple-homepod-3', 'Apple', 'Apple HomePod 3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_tvaudio, '2404831885159')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Apple%20HomePod%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 374.69, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Apple%20HomePod%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 341.75, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Apple%20HomePod%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 311.24, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Apple%20HomePod%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 341.83, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Apple%20HomePod%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 386.9, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Apple%20HomePod%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 381.9, 'CHF', NOW() - INTERVAL '19 days');

  -- HAUSHALT
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Dyson V15 Detect Staubsauger', 'dyson-v15-detect-staubsauger', 'Dyson', 'Dyson V15 Detect Staubsauger - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Dyson', cat_haushalt, '2566160321448')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Dyson%20V15%20Detect%20Staubsauger', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 489.18, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Dyson%20V15%20Detect%20Staubsauger', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 466.99, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Dyson%20V15%20Detect%20Staubsauger', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 477.91, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Dyson%20V15%20Detect%20Staubsauger', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 467.3, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Dyson%20V15%20Detect%20Staubsauger', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 444.3, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Dyson V12 Detect Slim', 'dyson-v12-detect-slim', 'Dyson', 'Dyson V12 Detect Slim - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Dyson', cat_haushalt, '2608920097575')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Dyson%20V12%20Detect%20Slim', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 350.6, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Dyson%20V12%20Detect%20Slim', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 339.26, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Dyson%20V12%20Detect%20Slim', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 429.61, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Dyson%20V12%20Detect%20Slim', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 447.51, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Dyson%20V12%20Detect%20Slim', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 363.83, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Dyson%20V12%20Detect%20Slim', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 454.48, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Dyson Gen5Detect', 'dyson-gen5detect', 'Dyson', 'Dyson Gen5Detect - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Dyson', cat_haushalt, '2514279371847')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Dyson%20Gen5Detect', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 752.14, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Dyson%20Gen5Detect', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 601.29, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Dyson%20Gen5Detect', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 665.28, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Dyson%20Gen5Detect', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 628.63, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Dyson 360 Vis Nav', 'dyson-360-vis-nav', 'Dyson', 'Dyson 360 Vis Nav - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Dyson', cat_haushalt, '2555892179202')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Dyson%20360%20Vis%20Nav', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1073.15, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Dyson%20360%20Vis%20Nav', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1007.68, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Dyson%20360%20Vis%20Nav', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1005.66, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Dyson%20360%20Vis%20Nav', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 877.86, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Dyson Airwrap Multi-Styler', 'dyson-airwrap-multi-styler', 'Dyson', 'Dyson Airwrap Multi-Styler - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Dyson', cat_haushalt, '2591642262851')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Dyson%20Airwrap%20Multi-Styler', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 455.35, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Dyson%20Airwrap%20Multi-Styler', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 412.98, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Dyson%20Airwrap%20Multi-Styler', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 470.33, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Dyson Supersonic Nural', 'dyson-supersonic-nural', 'Dyson', 'Dyson Supersonic Nural - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Dyson', cat_haushalt, '2015353005233')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Dyson%20Supersonic%20Nural', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 434.81, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Dyson%20Supersonic%20Nural', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 344.48, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Dyson%20Supersonic%20Nural', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 425.6, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Dyson%20Supersonic%20Nural', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 427.48, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Dyson%20Supersonic%20Nural', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 396.52, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('iRobot Roomba J9+', 'irobot-roomba-j9', 'iRobot', 'iRobot Roomba J9+ - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=iRobot', cat_haushalt, '2724138385668')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=iRobot%20Roomba%20J9%2B', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 907.07, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=iRobot%20Roomba%20J9%2B', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 919.6, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=iRobot%20Roomba%20J9%2B', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 797.39, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Philips Airfryer XXL', 'philips-airfryer-xxl', 'Philips', 'Philips Airfryer XXL - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Philips', cat_haushalt, '2049944438998')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Philips%20Airfryer%20XXL', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 222.35, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Philips%20Airfryer%20XXL', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 215.94, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Philips%20Airfryer%20XXL', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 226.34, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Philips%20Airfryer%20XXL', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 276.52, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Bespoke Jet AI', 'samsung-bespoke-jet-ai', 'Samsung', 'Samsung Bespoke Jet AI - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_haushalt, '2405218285012')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Bespoke%20Jet%20AI', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 731.46, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Bespoke%20Jet%20AI', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 735.26, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Bespoke%20Jet%20AI', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 890.4, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Bespoke%20Jet%20AI', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 786.44, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Bespoke Fridge 4-Tür', 'samsung-bespoke-fridge-4-t-r', 'Samsung', 'Samsung Bespoke Fridge 4-Tür - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_haushalt, '2745032685652')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Bespoke%20Fridge%204-T%C3%BCr', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2809.27, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Bespoke%20Fridge%204-T%C3%BCr', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2799.42, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Bespoke%20Fridge%204-T%C3%BCr', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2319.2, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Bosch Series 8 Waschmaschine', 'bosch-series-8-waschmaschine', 'Bosch', 'Bosch Series 8 Waschmaschine - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Bosch', cat_haushalt, '2524579439371')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Bosch%20Series%208%20Waschmaschine', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1409.32, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Bosch%20Series%208%20Waschmaschine', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1486.79, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Bosch%20Series%208%20Waschmaschine', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1346.53, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Bosch%20Series%208%20Waschmaschine', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1321.29, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Bosch%20Series%208%20Waschmaschine', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1361.47, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Miele Complete C3 Staubsauger', 'miele-complete-c3-staubsauger', 'Miele', 'Miele Complete C3 Staubsauger - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Miele', cat_haushalt, '2156819426702')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Miele%20Complete%20C3%20Staubsauger', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 328.75, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Miele%20Complete%20C3%20Staubsauger', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 355.87, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Miele%20Complete%20C3%20Staubsauger', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 361.94, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Miele%20Complete%20C3%20Staubsauger', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 305.47, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Miele Triflex HX2', 'miele-triflex-hx2', 'Miele', 'Miele Triflex HX2 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Miele', cat_haushalt, '2826550020938')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Miele%20Triflex%20HX2', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 538.51, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Miele%20Triflex%20HX2', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 456.34, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Miele%20Triflex%20HX2', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 508.43, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Miele%20Triflex%20HX2', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 428.87, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Miele%20Triflex%20HX2', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 424.92, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('KitchenAid Artisan 5KSM175', 'kitchenaid-artisan-5ksm175', 'KitchenAid', 'KitchenAid Artisan 5KSM175 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=KitchenAid', cat_haushalt, '2645358776806')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=KitchenAid%20Artisan%205KSM175', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 445.24, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=KitchenAid%20Artisan%205KSM175', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 528.53, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=KitchenAid%20Artisan%205KSM175', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 448.63, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Nespresso Vertuo Next', 'nespresso-vertuo-next', 'Nespresso', 'Nespresso Vertuo Next - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Nespresso', cat_haushalt, '2678303384694')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Nespresso%20Vertuo%20Next', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 110.36, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Nespresso%20Vertuo%20Next', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 125.29, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Nespresso%20Vertuo%20Next', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 119.66, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Nespresso%20Vertuo%20Next', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 102.59, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('De''''Longhi Magnifica S', 'de-longhi-magnifica-s', 'De''Longhi', 'De''''Longhi Magnifica S - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=De''Longhi', cat_haushalt, '2303536960479')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=De''''''''Longhi%20Magnifica%20S', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 475.18, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=De''''''''Longhi%20Magnifica%20S', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 565.8, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=De''''''''Longhi%20Magnifica%20S', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 467.47, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=De''''''''Longhi%20Magnifica%20S', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 536.07, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=De''''''''Longhi%20Magnifica%20S', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 469.9, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=De''''''''Longhi%20Magnifica%20S', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 427.83, 'CHF', NOW() - INTERVAL '21 days');

  -- LAPTOPS
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('MacBook Pro 16" M4 Max', 'macbook-pro-16-m4-max', 'Apple', 'MacBook Pro 16" M4 Max - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_laptops, '2639476346430')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=MacBook%20Pro%2016%22%20M4%20Max', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3460.92, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=MacBook%20Pro%2016%22%20M4%20Max', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3859.22, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=MacBook%20Pro%2016%22%20M4%20Max', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3039.22, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=MacBook%20Pro%2016%22%20M4%20Max', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3311.73, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('MacBook Pro 14" M4 Pro', 'macbook-pro-14-m4-pro', 'Apple', 'MacBook Pro 14" M4 Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_laptops, '2785972290607')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=MacBook%20Pro%2014%22%20M4%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2563.57, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=MacBook%20Pro%2014%22%20M4%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2549.42, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=MacBook%20Pro%2014%22%20M4%20Pro', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2531.29, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('MacBook Air 15" M4', 'macbook-air-15-m4', 'Apple', 'MacBook Air 15" M4 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_laptops, '2404821993348')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=MacBook%20Air%2015%22%20M4', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1292.69, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=MacBook%20Air%2015%22%20M4', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1409.52, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=MacBook%20Air%2015%22%20M4', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1327.27, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=MacBook%20Air%2015%22%20M4', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1389.98, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=MacBook%20Air%2015%22%20M4', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1635.88, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('MacBook Air 13" M4', 'macbook-air-13-m4', 'Apple', 'MacBook Air 13" M4 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_laptops, '2050742998731')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=MacBook%20Air%2013%22%20M4', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1283.95, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=MacBook%20Air%2013%22%20M4', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1068.75, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=MacBook%20Air%2013%22%20M4', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1093.08, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=MacBook%20Air%2013%22%20M4', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1268.94, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=MacBook%20Air%2013%22%20M4', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1178.66, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('MacBook Air 13" M3', 'macbook-air-13-m3', 'Apple', 'MacBook Air 13" M3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_laptops, '2416306027335')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=MacBook%20Air%2013%22%20M3', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 981.92, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=MacBook%20Air%2013%22%20M3', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1126.75, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=MacBook%20Air%2013%22%20M3', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 981.82, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=MacBook%20Air%2013%22%20M3', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 960.64, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=MacBook%20Air%2013%22%20M3', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1148, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Dell XPS 16 9640', 'dell-xps-16-9640', 'Dell', 'Dell XPS 16 9640 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Dell', cat_laptops, '2750674939926')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Dell%20XPS%2016%209640', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2169.53, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Dell%20XPS%2016%209640', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2277.08, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Dell%20XPS%2016%209640', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2112.89, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Dell%20XPS%2016%209640', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1953.85, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Dell%20XPS%2016%209640', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2244.49, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Dell XPS 14 9440', 'dell-xps-14-9440', 'Dell', 'Dell XPS 14 9440 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Dell', cat_laptops, '2227455661827')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Dell%20XPS%2014%209440', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1654.33, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Dell%20XPS%2014%209440', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1688.6, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Dell%20XPS%2014%209440', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1691.91, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Dell%20XPS%2014%209440', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1953.94, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Dell%20XPS%2014%209440', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1620.12, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Lenovo ThinkPad X1 Carbon Gen 12', 'lenovo-thinkpad-x1-carbon-gen-12', 'Lenovo', 'Lenovo ThinkPad X1 Carbon Gen 12 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Lenovo', cat_laptops, '2572657104664')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Lenovo%20ThinkPad%20X1%20Carbon%20Gen%2012', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2756.36, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Lenovo%20ThinkPad%20X1%20Carbon%20Gen%2012', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2339.12, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Lenovo%20ThinkPad%20X1%20Carbon%20Gen%2012', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2628.92, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Lenovo%20ThinkPad%20X1%20Carbon%20Gen%2012', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2424.13, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Lenovo%20ThinkPad%20X1%20Carbon%20Gen%2012', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2958.27, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Lenovo ThinkPad T16 Gen 3', 'lenovo-thinkpad-t16-gen-3', 'Lenovo', 'Lenovo ThinkPad T16 Gen 3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Lenovo', cat_laptops, '2582471447758')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Lenovo%20ThinkPad%20T16%20Gen%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2175.98, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Lenovo%20ThinkPad%20T16%20Gen%203', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1995.99, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Lenovo%20ThinkPad%20T16%20Gen%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1700, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Lenovo%20ThinkPad%20T16%20Gen%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2262.48, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Lenovo%20ThinkPad%20T16%20Gen%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1946.69, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Lenovo%20ThinkPad%20T16%20Gen%203', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1874.81, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('HP Spectre x360 16', 'hp-spectre-x360-16', 'HP', 'HP Spectre x360 16 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=HP', cat_laptops, '2099120351738')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=HP%20Spectre%20x360%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1989.14, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=HP%20Spectre%20x360%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2047.44, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=HP%20Spectre%20x360%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1813.79, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=HP%20Spectre%20x360%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1894.65, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=HP%20Spectre%20x360%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1855.04, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Asus ROG Zephyrus G16', 'asus-rog-zephyrus-g16', 'Asus', 'Asus ROG Zephyrus G16 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Asus', cat_laptops, '2132254963128')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Asus%20ROG%20Zephyrus%20G16', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2590.04, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Asus%20ROG%20Zephyrus%20G16', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2623.46, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Asus%20ROG%20Zephyrus%20G16', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2353.28, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Asus%20ROG%20Zephyrus%20G16', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2537.79, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Asus%20ROG%20Zephyrus%20G16', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2697.7, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Asus ZenBook S 16', 'asus-zenbook-s-16', 'Asus', 'Asus ZenBook S 16 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Asus', cat_laptops, '2716968878614')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Asus%20ZenBook%20S%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1533.36, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Asus%20ZenBook%20S%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1502.85, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Asus%20ZenBook%20S%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1350.56, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Asus%20ZenBook%20S%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1377.22, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Asus%20ZenBook%20S%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1474.89, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Microsoft Surface Laptop 7', 'microsoft-surface-laptop-7', 'Microsoft', 'Microsoft Surface Laptop 7 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Microsoft', cat_laptops, '2837524759366')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Microsoft%20Surface%20Laptop%207', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1347.9, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Microsoft%20Surface%20Laptop%207', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1268.98, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Microsoft%20Surface%20Laptop%207', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1324.32, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Galaxy Book4 Ultra', 'samsung-galaxy-book4-ultra', 'Samsung', 'Samsung Galaxy Book4 Ultra - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_laptops, '2747102995206')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Galaxy%20Book4%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2534.23, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Galaxy%20Book4%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3043.38, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Galaxy%20Book4%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2554.97, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Galaxy%20Book4%20Ultra', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3046.53, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Acer Swift Go 16', 'acer-swift-go-16', 'Acer', 'Acer Swift Go 16 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Acer', cat_laptops, '2257222195409')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Acer%20Swift%20Go%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 959.96, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Acer%20Swift%20Go%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1089.6, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Acer%20Swift%20Go%2016', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 936.75, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Acer%20Swift%20Go%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1114.29, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Acer%20Swift%20Go%2016', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 869.7, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Acer%20Swift%20Go%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 978.48, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Framework 16', 'framework-16', 'Framework', 'Framework 16 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Framework', cat_laptops, '2573974871701')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Framework%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2034.24, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Framework%2016', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1810.82, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Framework%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1577.16, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Framework%2016', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1707.2, 'CHF', NOW() - INTERVAL '6 days');

  -- KAMERAS
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony A7 V', 'sony-a7-v', 'Sony', 'Sony A7 V - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_kameras, '2394050531584')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20A7%20V', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3770.37, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sony%20A7%20V', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3666.37, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony A7R V', 'sony-a7r-v', 'Sony', 'Sony A7R V - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_kameras, '2683559326303')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sony%20A7R%20V', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4822.54, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sony%20A7R%20V', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4919.05, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sony%20A7R%20V', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4874.16, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sony%20A7R%20V', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4105.78, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20A7R%20V', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4250.76, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sony%20A7R%20V', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3903.87, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony A6700', 'sony-a6700', 'Sony', 'Sony A6700 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_kameras, '2074884998862')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sony%20A6700', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1317.67, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sony%20A6700', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1593.83, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20A6700', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1667.06, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sony%20A6700', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1716.61, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony ZV-E10 II', 'sony-zv-e10-ii', 'Sony', 'Sony ZV-E10 II - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_kameras, '2544870746142')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sony%20ZV-E10%20II', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1160.36, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sony%20ZV-E10%20II', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1007.1, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sony%20ZV-E10%20II', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 951.47, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sony%20ZV-E10%20II', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1112.72, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20ZV-E10%20II', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1128.9, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sony%20ZV-E10%20II', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 989.2, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Canon EOS R6 Mark III', 'canon-eos-r6-mark-iii', 'Canon', 'Canon EOS R6 Mark III - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Canon', cat_kameras, '2844369274630')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Canon%20EOS%20R6%20Mark%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2656.13, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Canon%20EOS%20R6%20Mark%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2866.55, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Canon%20EOS%20R6%20Mark%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3372.34, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Canon EOS R5 Mark II', 'canon-eos-r5-mark-ii', 'Canon', 'Canon EOS R5 Mark II - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Canon', cat_kameras, '2111521347486')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Canon%20EOS%20R5%20Mark%20II', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4465.39, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Canon%20EOS%20R5%20Mark%20II', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4081.98, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Canon%20EOS%20R5%20Mark%20II', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3979, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Canon%20EOS%20R5%20Mark%20II', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4311.4, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Canon%20EOS%20R5%20Mark%20II', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4659.25, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Canon%20EOS%20R5%20Mark%20II', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 5147.9, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Canon EOS R100', 'canon-eos-r100', 'Canon', 'Canon EOS R100 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Canon', cat_kameras, '2031082160524')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Canon%20EOS%20R100', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 609.95, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Canon%20EOS%20R100', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 481.86, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Canon%20EOS%20R100', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 479.74, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Canon%20EOS%20R100', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 604.58, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Canon%20EOS%20R100', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 537.32, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Nikon Z6 III', 'nikon-z6-iii', 'Nikon', 'Nikon Z6 III - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Nikon', cat_kameras, '2503469105123')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Nikon%20Z6%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2861.84, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Nikon%20Z6%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2724.35, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Nikon%20Z6%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3004.03, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Nikon%20Z6%20III', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2967.42, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Nikon Z8', 'nikon-z8', 'Nikon', 'Nikon Z8 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Nikon', cat_kameras, '2520743739797')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Nikon%20Z8', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3969.37, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Nikon%20Z8', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3968.26, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Nikon%20Z8', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3856.91, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Nikon%20Z8', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3942.24, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Nikon%20Z8', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3506.54, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Nikon%20Z8', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3461.12, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Fujifilm X-T6', 'fujifilm-x-t6', 'Fujifilm', 'Fujifilm X-T6 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Fujifilm', cat_kameras, '2867795901181')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Fujifilm%20X-T6', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1593.76, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Fujifilm%20X-T6', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1608.52, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Fujifilm%20X-T6', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1532.31, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Fujifilm%20X-T6', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1725.46, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Fujifilm%20X-T6', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1624.64, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Fujifilm X100 VI', 'fujifilm-x100-vi', 'Fujifilm', 'Fujifilm X100 VI - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Fujifilm', cat_kameras, '2120305319204')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Fujifilm%20X100%20VI', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1511.45, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Fujifilm%20X100%20VI', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1836.74, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Fujifilm%20X100%20VI', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1941.85, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Fujifilm%20X100%20VI', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1605.61, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Fujifilm%20X100%20VI', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1948.17, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Fujifilm%20X100%20VI', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1540.82, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Leica Q3 43', 'leica-q3-43', 'Leica', 'Leica Q3 43 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Leica', cat_kameras, '2227045181027')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Leica%20Q3%2043', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 6333.19, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Leica%20Q3%2043', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 6207.44, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Leica%20Q3%2043', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 6350.99, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Leica%20Q3%2043', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 8032.01, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Leica%20Q3%2043', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 7817.06, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('DJI Osmo Pocket 3', 'dji-osmo-pocket-3', 'DJI', 'DJI Osmo Pocket 3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=DJI', cat_kameras, '2102837517104')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=DJI%20Osmo%20Pocket%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 473.98, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=DJI%20Osmo%20Pocket%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 427.73, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=DJI%20Osmo%20Pocket%203', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 424.27, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=DJI%20Osmo%20Pocket%203', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 532.75, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=DJI%20Osmo%20Pocket%203', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 515.1, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('GoPro Hero 13 Black', 'gopro-hero-13-black', 'GoPro', 'GoPro Hero 13 Black - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=GoPro', cat_kameras, '2272325459268')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=GoPro%20Hero%2013%20Black', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 416.55, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=GoPro%20Hero%2013%20Black', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 491.53, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=GoPro%20Hero%2013%20Black', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 390.08, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=GoPro%20Hero%2013%20Black', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 510.56, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Insta360 X4', 'insta360-x4', 'Insta360', 'Insta360 X4 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Insta360', cat_kameras, '2840648179383')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Insta360%20X4', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 475.15, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Insta360%20X4', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 567.68, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Insta360%20X4', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 486.97, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Insta360%20X4', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 477.83, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Insta360%20X4', false)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 553.95, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Panasonic Lumix S5 IIX', 'panasonic-lumix-s5-iix', 'Panasonic', 'Panasonic Lumix S5 IIX - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Panasonic', cat_kameras, '2781127244724')
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Panasonic%20Lumix%20S5%20IIX', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1846.98, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Panasonic%20Lumix%20S5%20IIX', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1738.92, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Panasonic%20Lumix%20S5%20IIX', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1699.74, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Panasonic%20Lumix%20S5%20IIX', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1967.65, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Panasonic%20Lumix%20S5%20IIX', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2095.92, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Panasonic%20Lumix%20S5%20IIX', true)
    ON CONFLICT (product_id, shop_id) DO UPDATE SET product_url = EXCLUDED.product_url
    RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1758.42, 'CHF', NOW() - INTERVAL '23 days');
END $$;
