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
    VALUES ('Apple iPhone 17 Pro Max', 'apple-iphone-17-pro-max', 'Apple', 'Apple iPhone 17 Pro Max - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_smartphones, '2561495154797')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Apple%20iPhone%2017%20Pro%20Max', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1235.06, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Apple%20iPhone%2017%20Pro%20Max', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1140.86, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Apple%20iPhone%2017%20Pro%20Max', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1463.16, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Apple%20iPhone%2017%20Pro%20Max', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1355.39, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Apple%20iPhone%2017%20Pro%20Max', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1272.24, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Apple%20iPhone%2017%20Pro%20Max', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1148.41, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Apple iPhone 17 Pro', 'apple-iphone-17-pro', 'Apple', 'Apple iPhone 17 Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_smartphones, '2749559599165')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Apple%20iPhone%2017%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1129.74, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Apple%20iPhone%2017%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1171.18, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Apple%20iPhone%2017%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1021.74, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Apple%20iPhone%2017%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1005.61, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Apple%20iPhone%2017%20Pro', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1001.84, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Apple iPhone 17', 'apple-iphone-17', 'Apple', 'Apple iPhone 17 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_smartphones, '2136842266138')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Apple%20iPhone%2017', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 956.92, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Apple%20iPhone%2017', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 955.05, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Apple%20iPhone%2017', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 852.64, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Apple%20iPhone%2017', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1020.93, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Apple%20iPhone%2017', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 819.51, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Apple iPhone 16 Pro Max', 'apple-iphone-16-pro-max', 'Apple', 'Apple iPhone 16 Pro Max - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_smartphones, '2199529517271')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Apple%20iPhone%2016%20Pro%20Max', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1070.45, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Apple%20iPhone%2016%20Pro%20Max', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1201.97, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Apple%20iPhone%2016%20Pro%20Max', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1021.39, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Apple%20iPhone%2016%20Pro%20Max', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1097.58, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Apple%20iPhone%2016%20Pro%20Max', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1117.78, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Apple%20iPhone%2016%20Pro%20Max', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1270.79, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Apple iPhone 16', 'apple-iphone-16', 'Apple', 'Apple iPhone 16 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_smartphones, '2223011702386')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Apple%20iPhone%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 788.65, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Apple%20iPhone%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 757.56, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Apple%20iPhone%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 708.54, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Apple%20iPhone%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 836.53, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Apple iPhone SE 4', 'apple-iphone-se-4', 'Apple', 'Apple iPhone SE 4 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_smartphones, '2420097353895')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Apple%20iPhone%20SE%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 568.36, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Apple%20iPhone%20SE%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 615.28, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Apple%20iPhone%20SE%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 546.15, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Apple%20iPhone%20SE%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 515.12, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Apple%20iPhone%20SE%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 559.7, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Galaxy S26 Ultra', 'samsung-galaxy-s26-ultra', 'Samsung', 'Samsung Galaxy S26 Ultra - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_smartphones, '2777345094806')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Galaxy%20S26%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1344.35, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Galaxy%20S26%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1261.09, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Galaxy%20S26%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1131.58, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Galaxy%20S26%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1357.08, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Galaxy%20S26%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1255.24, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Galaxy S26+', 'samsung-galaxy-s26', 'Samsung', 'Samsung Galaxy S26+ - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_smartphones, '2876865005013')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Galaxy%20S26%2B', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 939.77, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Galaxy%20S26%2B', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1202.55, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Galaxy%20S26%2B', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1101.75, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Galaxy%20S26%2B', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1050.93, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Galaxy S26', 'samsung-galaxy-s26', 'Samsung', 'Samsung Galaxy S26 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_smartphones, '2603400008155')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Galaxy%20S26', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 933.69, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Galaxy%20S26', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 793.59, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Galaxy%20S26', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 945.52, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Galaxy%20S26', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 932.86, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Galaxy%20S26', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 776.97, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Galaxy S25', 'samsung-galaxy-s25', 'Samsung', 'Samsung Galaxy S25 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_smartphones, '2121752470082')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Galaxy%20S25', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 848.72, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Galaxy%20S25', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 749.99, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Galaxy%20S25', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 689.81, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Galaxy%20S25', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 665.46, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Galaxy%20S25', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 663.93, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Galaxy%20S25', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 820.27, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Galaxy A56', 'samsung-galaxy-a56', 'Samsung', 'Samsung Galaxy A56 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_smartphones, '2106413170846')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Galaxy%20A56', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 350.47, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Galaxy%20A56', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 374.95, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Galaxy%20A56', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 419.01, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Galaxy%20A56', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 429.89, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Galaxy%20A56', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 419.77, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Galaxy A36', 'samsung-galaxy-a36', 'Samsung', 'Samsung Galaxy A36 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_smartphones, '2190816053782')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Galaxy%20A36', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 278.03, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Galaxy%20A36', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 254.16, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Galaxy%20A36', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 296.29, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Galaxy%20A36', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 294.93, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Google Pixel 10 Pro', 'google-pixel-10-pro', 'Google', 'Google Pixel 10 Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Google', cat_smartphones, '2836060438426')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Google%20Pixel%2010%20Pro', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 964.85, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Google%20Pixel%2010%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 871.1, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Google%20Pixel%2010%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 858.7, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Google Pixel 10', 'google-pixel-10', 'Google', 'Google Pixel 10 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Google', cat_smartphones, '2332742164299')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Google%20Pixel%2010', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 705.93, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Google%20Pixel%2010', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 825.65, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Google%20Pixel%2010', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 857.55, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Google%20Pixel%2010', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 754.91, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Google%20Pixel%2010', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 763.06, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Xiaomi 15 Ultra', 'xiaomi-15-ultra', 'Xiaomi', 'Xiaomi 15 Ultra - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Xiaomi', cat_smartphones, '2056014221814')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Xiaomi%2015%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1250.08, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Xiaomi%2015%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1239.04, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Xiaomi%2015%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1017.2, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Xiaomi%2015%20Ultra', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1038.98, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Xiaomi%2015%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1094.16, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Xiaomi%2015%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1230.34, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Xiaomi 15', 'xiaomi-15', 'Xiaomi', 'Xiaomi 15 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Xiaomi', cat_smartphones, '2212085228261')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Xiaomi%2015', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 716.91, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Xiaomi%2015', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 803.72, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Xiaomi%2015', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 794.02, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Xiaomi%2015', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 785.39, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Xiaomi%2015', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 797.74, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Xiaomi%2015', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 749.25, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Xiaomi Redmi Note 14 Pro', 'xiaomi-redmi-note-14-pro', 'Xiaomi', 'Xiaomi Redmi Note 14 Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Xiaomi', cat_smartphones, '2853655290958')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Xiaomi%20Redmi%20Note%2014%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 312.83, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Xiaomi%20Redmi%20Note%2014%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 335.94, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Xiaomi%20Redmi%20Note%2014%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 326.36, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Xiaomi%20Redmi%20Note%2014%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 311.09, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Xiaomi%20Redmi%20Note%2014%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 304.27, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Xiaomi%20Redmi%20Note%2014%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 324.47, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('OnePlus 13', 'oneplus-13', 'OnePlus', 'OnePlus 13 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=OnePlus', cat_smartphones, '2457974799357')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=OnePlus%2013', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 846.32, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=OnePlus%2013', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 986.15, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=OnePlus%2013', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 876.75, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=OnePlus%2013', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 884.15, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Nothing Phone 3', 'nothing-phone-3', 'Nothing', 'Nothing Phone 3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Nothing', cat_smartphones, '2481821352311')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Nothing%20Phone%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 685.95, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Nothing%20Phone%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 671.85, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Nothing%20Phone%203', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 745.44, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Nothing%20Phone%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 783.94, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Nothing%20Phone%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 717.38, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Nothing%20Phone%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 664.4, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony Xperia 1 VII', 'sony-xperia-1-vii', 'Sony', 'Sony Xperia 1 VII - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_smartphones, '2495873935285')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sony%20Xperia%201%20VII', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1109.83, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sony%20Xperia%201%20VII', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1182.23, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20Xperia%201%20VII', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1024.98, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sony%20Xperia%201%20VII', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1109.52, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Motorola Edge 50 Pro', 'motorola-edge-50-pro', 'Motorola', 'Motorola Edge 50 Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Motorola', cat_smartphones, '2487355207695')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Motorola%20Edge%2050%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 604.7, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Motorola%20Edge%2050%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 582.8, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Motorola%20Edge%2050%20Pro', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 668.41, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Motorola%20Edge%2050%20Pro', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 515.82, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Motorola%20Edge%2050%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 666.63, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Fairphone 5', 'fairphone-5', 'Fairphone', 'Fairphone 5 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Fairphone', cat_smartphones, '2848100776155')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Fairphone%205', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 571.32, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Fairphone%205', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 643.02, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Fairphone%205', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 591.13, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Fairphone%205', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 613.44, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Huawei P80 Pro', 'huawei-p80-pro', 'Huawei', 'Huawei P80 Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Huawei', cat_smartphones, '2735846620153')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Huawei%20P80%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 853.23, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Huawei%20P80%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1135.67, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Asus Zenfone 12', 'asus-zenfone-12', 'Asus', 'Asus Zenfone 12 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Asus', cat_smartphones, '2566057348498')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Asus%20Zenfone%2012', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 765.36, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Asus%20Zenfone%2012', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 735.85, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Asus%20Zenfone%2012', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 828.16, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Asus%20Zenfone%2012', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 826.54, 'CHF', NOW() - INTERVAL '22 days');

  -- KOPFHORER
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony WH-1000XM6', 'sony-wh-1000xm6', 'Sony', 'Sony WH-1000XM6 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_kopfhorer, '2639369470156')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sony%20WH-1000XM6', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 433.26, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sony%20WH-1000XM6', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 450.91, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sony%20WH-1000XM6', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 341.73, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sony%20WH-1000XM6', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 424.53, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20WH-1000XM6', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 345.87, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony WF-1000XM6', 'sony-wf-1000xm6', 'Sony', 'Sony WF-1000XM6 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_kopfhorer, '2608393911208')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sony%20WF-1000XM6', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 316.46, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sony%20WF-1000XM6', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 321.92, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20WF-1000XM6', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 316.72, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sony%20WF-1000XM6', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 350.53, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('AirPods Max 2', 'airpods-max-2', 'Apple', 'AirPods Max 2 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_kopfhorer, '2576768426822')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=AirPods%20Max%202', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 680.97, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=AirPods%20Max%202', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 576.35, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=AirPods%20Max%202', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 550.68, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=AirPods%20Max%202', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 592.25, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=AirPods%20Max%202', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 544.59, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('AirPods Pro 3', 'airpods-pro-3', 'Apple', 'AirPods Pro 3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_kopfhorer, '2563586991202')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=AirPods%20Pro%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 280.44, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=AirPods%20Pro%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 308.56, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=AirPods%20Pro%203', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 239.02, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=AirPods%20Pro%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 271.07, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=AirPods%20Pro%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 248.56, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=AirPods%20Pro%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 315.93, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('AirPods 4', 'airpods-4', 'Apple', 'AirPods 4 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_kopfhorer, '2084200530469')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=AirPods%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 152.2, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=AirPods%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 168.46, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=AirPods%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 199.87, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=AirPods%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 158.89, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=AirPods%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 171.64, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=AirPods%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 204.78, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Bose QuietComfort Ultra', 'bose-quietcomfort-ultra', 'Bose', 'Bose QuietComfort Ultra - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Bose', cat_kopfhorer, '2540615557453')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Bose%20QuietComfort%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 470.2, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Bose%20QuietComfort%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 430.03, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Bose%20QuietComfort%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 513.2, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Bose%20QuietComfort%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 387.82, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Bose QC Ultra Earbuds', 'bose-qc-ultra-earbuds', 'Bose', 'Bose QC Ultra Earbuds - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Bose', cat_kopfhorer, '2637321953222')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Bose%20QC%20Ultra%20Earbuds', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 341.18, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Bose%20QC%20Ultra%20Earbuds', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 386.22, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Bose%20QC%20Ultra%20Earbuds', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 332.78, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Bose%20QC%20Ultra%20Earbuds', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 345.85, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sennheiser Momentum 5', 'sennheiser-momentum-5', 'Sennheiser', 'Sennheiser Momentum 5 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sennheiser', cat_kopfhorer, '2264310726228')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sennheiser%20Momentum%205', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 483.16, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sennheiser%20Momentum%205', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 464.9, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sennheiser%20Momentum%205', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 537.79, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sennheiser%20Momentum%205', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 546.35, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sennheiser%20Momentum%205', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 511.4, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sennheiser Momentum TW 5', 'sennheiser-momentum-tw-5', 'Sennheiser', 'Sennheiser Momentum TW 5 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sennheiser', cat_kopfhorer, '2682062420039')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sennheiser%20Momentum%20TW%205', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 387.34, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sennheiser%20Momentum%20TW%205', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 328.5, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sennheiser%20Momentum%20TW%205', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 373.07, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sennheiser%20Momentum%20TW%205', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 396.95, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sennheiser%20Momentum%20TW%205', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 337.68, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sennheiser%20Momentum%20TW%205', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 361.55, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Beats Studio Pro', 'beats-studio-pro', 'Beats', 'Beats Studio Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Beats', cat_kopfhorer, '2339063803238')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Beats%20Studio%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 381.14, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Beats%20Studio%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 430.82, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Beats%20Studio%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 447.69, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Beats%20Studio%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 417.77, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Beats%20Studio%20Pro', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 360.78, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Beats%20Studio%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 399.77, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Jabra Elite 10 Gen 2', 'jabra-elite-10-gen-2', 'Jabra', 'Jabra Elite 10 Gen 2 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Jabra', cat_kopfhorer, '2697844984889')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Jabra%20Elite%2010%20Gen%202', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 290.09, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Jabra%20Elite%2010%20Gen%202', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 245.15, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Jabra%20Elite%2010%20Gen%202', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 239.08, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Jabra%20Elite%2010%20Gen%202', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 306.71, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Marshall Monitor III', 'marshall-monitor-iii', 'Marshall', 'Marshall Monitor III - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Marshall', cat_kopfhorer, '2326367772609')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Marshall%20Monitor%20III', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 299.85, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Marshall%20Monitor%20III', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 338.05, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Marshall%20Monitor%20III', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 350, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Marshall%20Monitor%20III', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 375.83, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Nothing Ear 4', 'nothing-ear-4', 'Nothing', 'Nothing Ear 4 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Nothing', cat_kopfhorer, '2481321976997')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Nothing%20Ear%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 137.85, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Nothing%20Ear%204', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 155.69, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Nothing%20Ear%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 169.83, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Nothing%20Ear%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 163.64, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Nothing%20Ear%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 161.11, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('JBL Tune 770NC', 'jbl-tune-770nc', 'JBL', 'JBL Tune 770NC - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=JBL', cat_kopfhorer, '2079059452433')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=JBL%20Tune%20770NC', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 135.66, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=JBL%20Tune%20770NC', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 146.48, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=JBL%20Tune%20770NC', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 125.47, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=JBL%20Tune%20770NC', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 147.34, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=JBL%20Tune%20770NC', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 116.98, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Shure Aonic 50 Gen 2', 'shure-aonic-50-gen-2', 'Shure', 'Shure Aonic 50 Gen 2 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Shure', cat_kopfhorer, '2684444286124')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Shure%20Aonic%2050%20Gen%202', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 434.15, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Shure%20Aonic%2050%20Gen%202', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 450.74, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Shure%20Aonic%2050%20Gen%202', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 461.83, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Shure%20Aonic%2050%20Gen%202', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 433.7, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Shure%20Aonic%2050%20Gen%202', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 454.76, 'CHF', NOW() - INTERVAL '7 days');

  -- GAMING
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony PlayStation 6', 'sony-playstation-6', 'Sony', 'Sony PlayStation 6 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_gaming, '2059836434126')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sony%20PlayStation%206', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 548.34, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sony%20PlayStation%206', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 543.57, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sony%20PlayStation%206', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 560.88, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20PlayStation%206', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 547.02, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sony%20PlayStation%206', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 560.78, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony PS6 DualSense 2', 'sony-ps6-dualsense-2', 'Sony', 'Sony PS6 DualSense 2 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_gaming, '2203620442822')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sony%20PS6%20DualSense%202', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 69.36, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sony%20PS6%20DualSense%202', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 74.28, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20PS6%20DualSense%202', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 89.19, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sony%20PS6%20DualSense%202', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 75.11, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Nintendo Switch OLED', 'nintendo-switch-oled', 'Nintendo', 'Nintendo Switch OLED - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Nintendo', cat_gaming, '2162259952848')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Nintendo%20Switch%20OLED', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 326.78, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Nintendo%20Switch%20OLED', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 284.34, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Nintendo%20Switch%20OLED', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 324.29, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Xbox Series X 2TB', 'xbox-series-x-2tb', 'Microsoft', 'Xbox Series X 2TB - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Microsoft', cat_gaming, '2420810570409')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Xbox%20Series%20X%202TB', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 588.68, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Xbox%20Series%20X%202TB', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 562.75, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Xbox%20Series%20X%202TB', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 468.97, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Xbox%20Series%20X%202TB', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 501.87, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Xbox Series S 1TB', 'xbox-series-s-1tb', 'Microsoft', 'Xbox Series S 1TB - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Microsoft', cat_gaming, '2129131300854')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Xbox%20Series%20S%201TB', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 300.87, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Xbox%20Series%20S%201TB', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 339.5, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Xbox%20Series%20S%201TB', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 372.43, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Xbox%20Series%20S%201TB', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 351.85, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Xbox%20Series%20S%201TB', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 313.56, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Asus ROG Ally X', 'asus-rog-ally-x', 'Asus', 'Asus ROG Ally X - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Asus', cat_gaming, '2764908016882')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Asus%20ROG%20Ally%20X', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 991.39, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Asus%20ROG%20Ally%20X', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 809.67, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Asus%20ROG%20Ally%20X', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 867.58, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Asus%20ROG%20Ally%20X', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 946.82, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Steam Deck OLED', 'steam-deck-oled', 'Valve', 'Steam Deck OLED - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Valve', cat_gaming, '2359141335729')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Steam%20Deck%20OLED', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 596.51, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Steam%20Deck%20OLED', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 654.14, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Steam%20Deck%20OLED', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 583.32, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Steam%20Deck%20OLED', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 777.2, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Steam%20Deck%20OLED', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 591.08, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Steam%20Deck%20OLED', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 702.71, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Logitech G Pro X Superlight 2', 'logitech-g-pro-x-superlight-2', 'Logitech', 'Logitech G Pro X Superlight 2 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Logitech', cat_gaming, '2257778741007')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Logitech%20G%20Pro%20X%20Superlight%202', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 131.68, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Logitech%20G%20Pro%20X%20Superlight%202', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 141.69, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Logitech%20G%20Pro%20X%20Superlight%202', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 154.49, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Logitech%20G%20Pro%20X%20Superlight%202', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 155.47, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Logitech%20G%20Pro%20X%20Superlight%202', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 127.71, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Razer DeathAdder V4 Pro', 'razer-deathadder-v4-pro', 'Razer', 'Razer DeathAdder V4 Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Razer', cat_gaming, '2888424038750')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Razer%20DeathAdder%20V4%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 154.46, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Razer%20DeathAdder%20V4%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 143.64, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Razer%20DeathAdder%20V4%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 128.84, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Razer%20DeathAdder%20V4%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 134.71, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Razer%20DeathAdder%20V4%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 143.92, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Corsair K70 Max', 'corsair-k70-max', 'Corsair', 'Corsair K70 Max - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Corsair', cat_gaming, '2613881052006')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Corsair%20K70%20Max', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 240.36, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Corsair%20K70%20Max', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 202.47, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Corsair%20K70%20Max', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 221.83, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Corsair%20K70%20Max', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 207.29, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Corsair%20K70%20Max', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 254.45, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('HyperX Cloud Alpha Wireless', 'hyperx-cloud-alpha-wireless', 'HyperX', 'HyperX Cloud Alpha Wireless - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=HyperX', cat_gaming, '2440742469091')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=HyperX%20Cloud%20Alpha%20Wireless', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 176.17, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=HyperX%20Cloud%20Alpha%20Wireless', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 175.99, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=HyperX%20Cloud%20Alpha%20Wireless', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 188.44, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Razer Kraken V4 Pro', 'razer-kraken-v4-pro', 'Razer', 'Razer Kraken V4 Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Razer', cat_gaming, '2474499310874')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Razer%20Kraken%20V4%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 212.79, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Razer%20Kraken%20V4%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 227.12, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Razer%20Kraken%20V4%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 191.72, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Razer%20Kraken%20V4%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 188.14, 'CHF', NOW() - INTERVAL '27 days');

  -- SMARTWATCHES
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Apple Watch Ultra 3', 'apple-watch-ultra-3', 'Apple', 'Apple Watch Ultra 3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_smartwatches, '2896084733460')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Apple%20Watch%20Ultra%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 940.68, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Apple%20Watch%20Ultra%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 794.15, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Apple%20Watch%20Ultra%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 881.08, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Apple Watch Series 11', 'apple-watch-series-11', 'Apple', 'Apple Watch Series 11 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_smartwatches, '2051317123345')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Apple%20Watch%20Series%2011', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 439.94, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Apple%20Watch%20Series%2011', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 466.72, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Apple Watch SE 3', 'apple-watch-se-3', 'Apple', 'Apple Watch SE 3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_smartwatches, '2680240375137')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Apple%20Watch%20SE%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 327.67, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Apple%20Watch%20SE%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 337.36, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Apple%20Watch%20SE%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 321.62, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Apple%20Watch%20SE%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 305.76, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Apple%20Watch%20SE%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 267.2, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Galaxy Watch 8', 'samsung-galaxy-watch-8', 'Samsung', 'Samsung Galaxy Watch 8 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_smartwatches, '2479775207963')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Galaxy%20Watch%208', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 392.48, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Galaxy%20Watch%208', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 434.52, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Galaxy%20Watch%208', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 392.56, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Galaxy%20Watch%208', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 429.8, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Galaxy%20Watch%208', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 489.97, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Galaxy Watch 8 Classic', 'samsung-galaxy-watch-8-classic', 'Samsung', 'Samsung Galaxy Watch 8 Classic - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_smartwatches, '2783963933086')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Galaxy%20Watch%208%20Classic', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 451.07, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Galaxy%20Watch%208%20Classic', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 554.3, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Galaxy%20Watch%208%20Classic', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 443.38, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Galaxy%20Watch%208%20Classic', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 426.63, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Galaxy%20Watch%208%20Classic', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 534.35, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Garmin Fenix 8', 'garmin-fenix-8', 'Garmin', 'Garmin Fenix 8 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Garmin', cat_smartwatches, '2868706696661')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Garmin%20Fenix%208', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1027.6, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Garmin%20Fenix%208', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 932.49, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Garmin%20Fenix%208', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 988.45, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Garmin Forerunner 265', 'garmin-forerunner-265', 'Garmin', 'Garmin Forerunner 265 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Garmin', cat_smartwatches, '2276002974657')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Garmin%20Forerunner%20265', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 443.18, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Garmin%20Forerunner%20265', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 457.73, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Garmin%20Forerunner%20265', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 471.97, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Garmin Venu 4', 'garmin-venu-4', 'Garmin', 'Garmin Venu 4 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Garmin', cat_smartwatches, '2590795118532')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Garmin%20Venu%204', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 381.43, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Garmin%20Venu%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 351.3, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Garmin%20Venu%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 442.1, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Garmin%20Venu%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 342.99, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Google Pixel Watch 4', 'google-pixel-watch-4', 'Google', 'Google Pixel Watch 4 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Google', cat_smartwatches, '2624237886050')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Google%20Pixel%20Watch%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 438.8, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Google%20Pixel%20Watch%204', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 391.01, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Google%20Pixel%20Watch%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 411.23, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Google%20Pixel%20Watch%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 372.33, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Google%20Pixel%20Watch%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 420.16, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Google Pixel Watch 4 Pro', 'google-pixel-watch-4-pro', 'Google', 'Google Pixel Watch 4 Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Google', cat_smartwatches, '2035881407377')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Google%20Pixel%20Watch%204%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 500.42, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Google%20Pixel%20Watch%204%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 492.89, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Google%20Pixel%20Watch%204%20Pro', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 566.11, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Google%20Pixel%20Watch%204%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 470.31, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Withings ScanWatch Nova', 'withings-scanwatch-nova', 'Withings', 'Withings ScanWatch Nova - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Withings', cat_smartwatches, '2690079966688')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Withings%20ScanWatch%20Nova', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 580.18, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Withings%20ScanWatch%20Nova', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 643.44, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Withings%20ScanWatch%20Nova', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 645.04, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Withings%20ScanWatch%20Nova', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 603.01, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Withings%20ScanWatch%20Nova', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 618.69, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Withings%20ScanWatch%20Nova', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 649.65, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Huawei Watch GT 6', 'huawei-watch-gt-6', 'Huawei', 'Huawei Watch GT 6 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Huawei', cat_smartwatches, '2662213818152')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Huawei%20Watch%20GT%206', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 304.87, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Huawei%20Watch%20GT%206', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 328.53, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Huawei%20Watch%20GT%206', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 373.27, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Huawei%20Watch%20GT%206', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 301.43, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Huawei%20Watch%20GT%206', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 313.9, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Fitbit Charge 7', 'fitbit-charge-7', 'Fitbit', 'Fitbit Charge 7 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Fitbit', cat_smartwatches, '2452009722233')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Fitbit%20Charge%207', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 205.42, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Fitbit%20Charge%207', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 153.8, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Fitbit%20Charge%207', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 179.5, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Fitbit%20Charge%207', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 172.72, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Fitbit%20Charge%207', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 174.23, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Amazfit T-Rex 4', 'amazfit-t-rex-4', 'Amazfit', 'Amazfit T-Rex 4 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Amazfit', cat_smartwatches, '2490968922214')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Amazfit%20T-Rex%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 194.38, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Amazfit%20T-Rex%204', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 188.27, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Amazfit%20T-Rex%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 198.42, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Amazfit%20T-Rex%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 211.87, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Amazfit%20T-Rex%204', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 193.14, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('OnePlus Watch 3', 'oneplus-watch-3', 'OnePlus', 'OnePlus Watch 3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=OnePlus', cat_smartwatches, '2047369828033')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=OnePlus%20Watch%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 369.31, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=OnePlus%20Watch%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 287.44, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=OnePlus%20Watch%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 299.26, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=OnePlus%20Watch%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 352.98, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=OnePlus%20Watch%203', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 347.66, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=OnePlus%20Watch%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 345.54, 'CHF', NOW() - INTERVAL '5 days');

  -- TV-AUDIO
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung OLED S95F 65"', 'samsung-oled-s95f-65', 'Samsung', 'Samsung OLED S95F 65" - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_tvaudio, '2870134748244')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20OLED%20S95F%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2441.04, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20OLED%20S95F%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2469, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20OLED%20S95F%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2146.57, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20OLED%20S95F%2065%22', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2332.84, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Neo QLED QN90F 65"', 'samsung-neo-qled-qn90f-65', 'Samsung', 'Samsung Neo QLED QN90F 65" - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_tvaudio, '2173377003542')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Neo%20QLED%20QN90F%2065%22', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1652.35, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Neo%20QLED%20QN90F%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1940.1, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Neo%20QLED%20QN90F%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1713.88, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Neo%20QLED%20QN90F%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1601.51, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Neo QLED QN90F 55"', 'samsung-neo-qled-qn90f-55', 'Samsung', 'Samsung Neo QLED QN90F 55" - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_tvaudio, '2291459839254')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Neo%20QLED%20QN90F%2055%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1314.22, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Neo%20QLED%20QN90F%2055%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1232.72, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Neo%20QLED%20QN90F%2055%22', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1353.88, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('LG G5 OLED 65"', 'lg-g5-oled-65', 'LG', 'LG G5 OLED 65" - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=LG', cat_tvaudio, '2531367472040')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=LG%20G5%20OLED%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2537.24, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=LG%20G5%20OLED%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2635.21, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=LG%20G5%20OLED%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2632.23, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=LG%20G5%20OLED%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3122.25, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('LG C5 OLED 65"', 'lg-c5-oled-65', 'LG', 'LG C5 OLED 65" - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=LG', cat_tvaudio, '2587583263867')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=LG%20C5%20OLED%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1921.05, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=LG%20C5%20OLED%2065%22', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1706.27, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=LG%20C5%20OLED%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2104.12, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('LG C5 OLED 55"', 'lg-c5-oled-55', 'LG', 'LG C5 OLED 55" - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=LG', cat_tvaudio, '2515999041011')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=LG%20C5%20OLED%2055%22', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1540.6, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=LG%20C5%20OLED%2055%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1479.63, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=LG%20C5%20OLED%2055%22', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1665.37, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=LG%20C5%20OLED%2055%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1423.2, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=LG%20C5%20OLED%2055%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1631.46, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=LG%20C5%20OLED%2055%22', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1508.77, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony Bravia 9 65"', 'sony-bravia-9-65', 'Sony', 'Sony Bravia 9 65" - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_tvaudio, '2229059168905')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sony%20Bravia%209%2065%22', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2317.91, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sony%20Bravia%209%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2271.94, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sony%20Bravia%209%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2181.67, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20Bravia%209%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2202.73, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony Bravia 8 OLED 65"', 'sony-bravia-8-oled-65', 'Sony', 'Sony Bravia 8 OLED 65" - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_tvaudio, '2387299832043')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sony%20Bravia%208%20OLED%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1970.69, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sony%20Bravia%208%20OLED%2065%22', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2280.01, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sony%20Bravia%208%20OLED%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2196.31, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sony%20Bravia%208%20OLED%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1746.42, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20Bravia%208%20OLED%2065%22', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1889.05, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Panasonic Z95C OLED 65"', 'panasonic-z95c-oled-65', 'Panasonic', 'Panasonic Z95C OLED 65" - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Panasonic', cat_tvaudio, '2615885840660')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Panasonic%20Z95C%20OLED%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2481.57, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Panasonic%20Z95C%20OLED%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2948.09, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Panasonic%20Z95C%20OLED%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2418.1, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Panasonic%20Z95C%20OLED%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2332.61, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Panasonic%20Z95C%20OLED%2065%22', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2412.34, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Panasonic%20Z95C%20OLED%2065%22', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2874.56, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Soundbar HW-Q990F', 'samsung-soundbar-hw-q990f', 'Samsung', 'Samsung Soundbar HW-Q990F - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_tvaudio, '2698730494949')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Soundbar%20HW-Q990F', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1563.94, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Soundbar%20HW-Q990F', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1292.92, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Soundbar%20HW-Q990F', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1314.99, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Soundbar HW-Q800F', 'samsung-soundbar-hw-q800f', 'Samsung', 'Samsung Soundbar HW-Q800F - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_tvaudio, '2452965407967')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Soundbar%20HW-Q800F', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 842.13, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Soundbar%20HW-Q800F', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 798.25, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Soundbar%20HW-Q800F', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 882.62, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Soundbar%20HW-Q800F', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 859.73, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Soundbar%20HW-Q800F', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 720.96, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Soundbar%20HW-Q800F', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 903.54, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sonos Arc Ultra', 'sonos-arc-ultra', 'Sonos', 'Sonos Arc Ultra - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sonos', cat_tvaudio, '2673012170596')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sonos%20Arc%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1120.51, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sonos%20Arc%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 893.63, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sonos%20Arc%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1100.35, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sonos%20Arc%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1139.84, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sonos%20Arc%20Ultra', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1078.18, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sonos%20Arc%20Ultra', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 938.63, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sonos Beam Gen 3', 'sonos-beam-gen-3', 'Sonos', 'Sonos Beam Gen 3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sonos', cat_tvaudio, '2777625518933')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sonos%20Beam%20Gen%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 471.09, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sonos%20Beam%20Gen%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 560.37, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sonos%20Beam%20Gen%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 475.46, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sonos%20Beam%20Gen%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 560.21, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sonos%20Beam%20Gen%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 563.43, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sonos Era 300', 'sonos-era-300', 'Sonos', 'Sonos Era 300 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sonos', cat_tvaudio, '2003499176299')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sonos%20Era%20300', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 458.75, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sonos%20Era%20300', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 441.49, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sonos%20Era%20300', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 535.36, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sonos%20Era%20300', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 436.42, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sonos Era 100', 'sonos-era-100', 'Sonos', 'Sonos Era 100 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sonos', cat_tvaudio, '2265280076591')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sonos%20Era%20100', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 285.65, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sonos%20Era%20100', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 274, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sonos%20Era%20100', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 240.7, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sonos%20Era%20100', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 310.6, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Marshall Stanmore III', 'marshall-stanmore-iii', 'Marshall', 'Marshall Stanmore III - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Marshall', cat_tvaudio, '2117851935857')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Marshall%20Stanmore%20III', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 408.93, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Marshall Woburn III', 'marshall-woburn-iii', 'Marshall', 'Marshall Woburn III - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Marshall', cat_tvaudio, '2475922330574')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Marshall%20Woburn%20III', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 592.6, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Marshall%20Woburn%20III', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 530.94, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Marshall%20Woburn%20III', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 533.01, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Marshall%20Woburn%20III', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 471.68, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Marshall%20Woburn%20III', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 485.15, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('JBL PartyBox 320', 'jbl-partybox-320', 'JBL', 'JBL PartyBox 320 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=JBL', cat_tvaudio, '2042018165479')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=JBL%20PartyBox%20320', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 402.76, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=JBL%20PartyBox%20320', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 350.48, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=JBL%20PartyBox%20320', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 371.28, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=JBL%20PartyBox%20320', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 455.21, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=JBL%20PartyBox%20320', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 369.84, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Apple HomePod 3', 'apple-homepod-3', 'Apple', 'Apple HomePod 3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_tvaudio, '2172230379681')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Apple%20HomePod%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 306.15, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Apple%20HomePod%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 371.58, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Apple%20HomePod%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 379.76, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Apple%20HomePod%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 328.73, 'CHF', NOW() - INTERVAL '29 days');

  -- HAUSHALT
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Dyson V15 Detect Staubsauger', 'dyson-v15-detect-staubsauger', 'Dyson', 'Dyson V15 Detect Staubsauger - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Dyson', cat_haushalt, '2109676188688')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Dyson%20V15%20Detect%20Staubsauger', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 460.49, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Dyson%20V15%20Detect%20Staubsauger', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 461.86, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Dyson%20V15%20Detect%20Staubsauger', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 469.4, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Dyson V12 Detect Slim', 'dyson-v12-detect-slim', 'Dyson', 'Dyson V12 Detect Slim - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Dyson', cat_haushalt, '2480888248084')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Dyson%20V12%20Detect%20Slim', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 374.76, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Dyson%20V12%20Detect%20Slim', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 418.35, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Dyson%20V12%20Detect%20Slim', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 412.53, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Dyson%20V12%20Detect%20Slim', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 398.87, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Dyson%20V12%20Detect%20Slim', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 342.9, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Dyson Gen5Detect', 'dyson-gen5detect', 'Dyson', 'Dyson Gen5Detect - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Dyson', cat_haushalt, '2768316768785')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Dyson%20Gen5Detect', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 661, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Dyson%20Gen5Detect', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 614.03, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Dyson%20Gen5Detect', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 763.14, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Dyson%20Gen5Detect', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 695.9, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Dyson 360 Vis Nav', 'dyson-360-vis-nav', 'Dyson', 'Dyson 360 Vis Nav - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Dyson', cat_haushalt, '2293656603744')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Dyson%20360%20Vis%20Nav', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 978.13, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Dyson%20360%20Vis%20Nav', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 958.81, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Dyson%20360%20Vis%20Nav', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1014.42, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Dyson%20360%20Vis%20Nav', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 855.21, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Dyson%20360%20Vis%20Nav', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1038.93, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Dyson Airwrap Multi-Styler', 'dyson-airwrap-multi-styler', 'Dyson', 'Dyson Airwrap Multi-Styler - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Dyson', cat_haushalt, '2508310214793')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Dyson%20Airwrap%20Multi-Styler', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 417.19, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Dyson%20Airwrap%20Multi-Styler', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 484.68, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Dyson%20Airwrap%20Multi-Styler', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 446.44, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Dyson%20Airwrap%20Multi-Styler', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 422.04, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Dyson Supersonic Nural', 'dyson-supersonic-nural', 'Dyson', 'Dyson Supersonic Nural - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Dyson', cat_haushalt, '2375098941574')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Dyson%20Supersonic%20Nural', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 436.82, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Dyson%20Supersonic%20Nural', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 405.71, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Dyson%20Supersonic%20Nural', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 413.84, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Dyson%20Supersonic%20Nural', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 400.16, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Dyson%20Supersonic%20Nural', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 368.79, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Dyson%20Supersonic%20Nural', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 427.59, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('iRobot Roomba J9+', 'irobot-roomba-j9', 'iRobot', 'iRobot Roomba J9+ - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=iRobot', cat_haushalt, '2274613952512')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=iRobot%20Roomba%20J9%2B', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 814.02, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=iRobot%20Roomba%20J9%2B', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 978.32, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=iRobot%20Roomba%20J9%2B', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1026.07, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=iRobot%20Roomba%20J9%2B', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 863.48, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=iRobot%20Roomba%20J9%2B', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 940.4, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Philips Airfryer XXL', 'philips-airfryer-xxl', 'Philips', 'Philips Airfryer XXL - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Philips', cat_haushalt, '2519526431567')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Philips%20Airfryer%20XXL', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 247.94, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Philips%20Airfryer%20XXL', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 268.18, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Philips%20Airfryer%20XXL', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 279.71, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Bespoke Jet AI', 'samsung-bespoke-jet-ai', 'Samsung', 'Samsung Bespoke Jet AI - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_haushalt, '2874752504039')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Samsung%20Bespoke%20Jet%20AI', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 794.73, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Bespoke%20Jet%20AI', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 890.92, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Bespoke%20Jet%20AI', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 812.55, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Bespoke%20Jet%20AI', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 786.1, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Bespoke%20Jet%20AI', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 789.5, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Bespoke Fridge 4-Tür', 'samsung-bespoke-fridge-4-t-r', 'Samsung', 'Samsung Bespoke Fridge 4-Tür - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_haushalt, '2274651781442')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Bespoke%20Fridge%204-T%C3%BCr', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2250.7, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Bespoke%20Fridge%204-T%C3%BCr', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2289.72, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Bespoke%20Fridge%204-T%C3%BCr', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2248.81, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Samsung%20Bespoke%20Fridge%204-T%C3%BCr', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2702.93, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Bespoke%20Fridge%204-T%C3%BCr', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2577.65, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Bosch Series 8 Waschmaschine', 'bosch-series-8-waschmaschine', 'Bosch', 'Bosch Series 8 Waschmaschine - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Bosch', cat_haushalt, '2079838349540')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Bosch%20Series%208%20Waschmaschine', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1472.18, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Bosch%20Series%208%20Waschmaschine', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1316.91, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Bosch%20Series%208%20Waschmaschine', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1268.46, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Miele Complete C3 Staubsauger', 'miele-complete-c3-staubsauger', 'Miele', 'Miele Complete C3 Staubsauger - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Miele', cat_haushalt, '2865618000411')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Miele%20Complete%20C3%20Staubsauger', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 353.18, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Miele%20Complete%20C3%20Staubsauger', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 399.53, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Miele%20Complete%20C3%20Staubsauger', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 350.93, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Miele%20Complete%20C3%20Staubsauger', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 305.94, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Miele%20Complete%20C3%20Staubsauger', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 377.24, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Miele Triflex HX2', 'miele-triflex-hx2', 'Miele', 'Miele Triflex HX2 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Miele', cat_haushalt, '2095695773359')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Miele%20Triflex%20HX2', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 495.71, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Miele%20Triflex%20HX2', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 552.19, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Miele%20Triflex%20HX2', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 515.74, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Miele%20Triflex%20HX2', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 524.25, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Miele%20Triflex%20HX2', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 503.74, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('KitchenAid Artisan 5KSM175', 'kitchenaid-artisan-5ksm175', 'KitchenAid', 'KitchenAid Artisan 5KSM175 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=KitchenAid', cat_haushalt, '2708120322705')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=KitchenAid%20Artisan%205KSM175', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 520.66, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=KitchenAid%20Artisan%205KSM175', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 565.15, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=KitchenAid%20Artisan%205KSM175', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 457.38, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=KitchenAid%20Artisan%205KSM175', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 493.97, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Nespresso Vertuo Next', 'nespresso-vertuo-next', 'Nespresso', 'Nespresso Vertuo Next - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Nespresso', cat_haushalt, '2881429660053')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Nespresso%20Vertuo%20Next', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 119.13, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Nespresso%20Vertuo%20Next', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 129.86, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Nespresso%20Vertuo%20Next', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 114.88, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Nespresso%20Vertuo%20Next', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 117.64, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Nespresso%20Vertuo%20Next', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 132.09, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('De''''Longhi Magnifica S', 'de-longhi-magnifica-s', 'De''Longhi', 'De''''Longhi Magnifica S - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=De''Longhi', cat_haushalt, '2623700380627')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=De''''''''Longhi%20Magnifica%20S', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 545.41, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=De''''''''Longhi%20Magnifica%20S', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 462.99, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=De''''''''Longhi%20Magnifica%20S', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 511.69, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=De''''''''Longhi%20Magnifica%20S', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 444.55, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=De''''''''Longhi%20Magnifica%20S', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 515.37, 'CHF', NOW() - INTERVAL '3 days');

  -- LAPTOPS
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('MacBook Pro 16" M4 Max', 'macbook-pro-16-m4-max', 'Apple', 'MacBook Pro 16" M4 Max - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_laptops, '2745761961559')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=MacBook%20Pro%2016%22%20M4%20Max', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3974.84, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=MacBook%20Pro%2016%22%20M4%20Max', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3260.65, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=MacBook%20Pro%2016%22%20M4%20Max', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3697.28, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=MacBook%20Pro%2016%22%20M4%20Max', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3830.85, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('MacBook Pro 14" M4 Pro', 'macbook-pro-14-m4-pro', 'Apple', 'MacBook Pro 14" M4 Pro - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_laptops, '2580263095674')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=MacBook%20Pro%2014%22%20M4%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2728.58, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=MacBook%20Pro%2014%22%20M4%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2764.27, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=MacBook%20Pro%2014%22%20M4%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2241.23, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=MacBook%20Pro%2014%22%20M4%20Pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2572.7, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=MacBook%20Pro%2014%22%20M4%20Pro', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2235.4, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('MacBook Air 15" M4', 'macbook-air-15-m4', 'Apple', 'MacBook Air 15" M4 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_laptops, '2079736226559')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=MacBook%20Air%2015%22%20M4', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1287.12, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=MacBook%20Air%2015%22%20M4', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1550.62, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=MacBook%20Air%2015%22%20M4', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1540.8, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=MacBook%20Air%2015%22%20M4', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1345.19, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=MacBook%20Air%2015%22%20M4', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1379.46, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('MacBook Air 13" M4', 'macbook-air-13-m4', 'Apple', 'MacBook Air 13" M4 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_laptops, '2665760309255')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=MacBook%20Air%2013%22%20M4', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1177.56, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=MacBook%20Air%2013%22%20M4', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1308.42, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=MacBook%20Air%2013%22%20M4', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1035.65, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=MacBook%20Air%2013%22%20M4', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1180.09, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=MacBook%20Air%2013%22%20M4', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1289.73, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('MacBook Air 13" M3', 'macbook-air-13-m3', 'Apple', 'MacBook Air 13" M3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Apple', cat_laptops, '2329696080056')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=MacBook%20Air%2013%22%20M3', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1010.63, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=MacBook%20Air%2013%22%20M3', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 930.78, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=MacBook%20Air%2013%22%20M3', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1130.83, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=MacBook%20Air%2013%22%20M3', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1049.62, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=MacBook%20Air%2013%22%20M3', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1032.11, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Dell XPS 16 9640', 'dell-xps-16-9640', 'Dell', 'Dell XPS 16 9640 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Dell', cat_laptops, '2383845886708')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Dell%20XPS%2016%209640', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2168.82, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Dell%20XPS%2016%209640', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2021.45, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Dell%20XPS%2016%209640', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2514.93, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Dell%20XPS%2016%209640', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1949.14, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Dell XPS 14 9440', 'dell-xps-14-9440', 'Dell', 'Dell XPS 14 9440 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Dell', cat_laptops, '2453208438274')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Dell%20XPS%2014%209440', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2025.01, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Dell%20XPS%2014%209440', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1572.4, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Dell%20XPS%2014%209440', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2041.06, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Dell%20XPS%2014%209440', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1648.61, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Dell%20XPS%2014%209440', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1562.93, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Dell%20XPS%2014%209440', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1991.43, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Lenovo ThinkPad X1 Carbon Gen 12', 'lenovo-thinkpad-x1-carbon-gen-12', 'Lenovo', 'Lenovo ThinkPad X1 Carbon Gen 12 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Lenovo', cat_laptops, '2172155477869')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Lenovo%20ThinkPad%20X1%20Carbon%20Gen%2012', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2866.84, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Lenovo%20ThinkPad%20X1%20Carbon%20Gen%2012', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2365.6, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Lenovo%20ThinkPad%20X1%20Carbon%20Gen%2012', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2649.93, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Lenovo%20ThinkPad%20X1%20Carbon%20Gen%2012', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2572.62, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Lenovo%20ThinkPad%20X1%20Carbon%20Gen%2012', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2952.98, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Lenovo%20ThinkPad%20X1%20Carbon%20Gen%2012', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2324.32, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Lenovo ThinkPad T16 Gen 3', 'lenovo-thinkpad-t16-gen-3', 'Lenovo', 'Lenovo ThinkPad T16 Gen 3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Lenovo', cat_laptops, '2441381120060')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Lenovo%20ThinkPad%20T16%20Gen%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1744.39, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Lenovo%20ThinkPad%20T16%20Gen%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1821.91, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Lenovo%20ThinkPad%20T16%20Gen%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1748.07, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Lenovo%20ThinkPad%20T16%20Gen%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2112.53, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Lenovo%20ThinkPad%20T16%20Gen%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2257.11, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('HP Spectre x360 16', 'hp-spectre-x360-16', 'HP', 'HP Spectre x360 16 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=HP', cat_laptops, '2096530220716')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=HP%20Spectre%20x360%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2044.84, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=HP%20Spectre%20x360%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1945.77, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=HP%20Spectre%20x360%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1812.23, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=HP%20Spectre%20x360%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2066.28, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=HP%20Spectre%20x360%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2176.02, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Asus ROG Zephyrus G16', 'asus-rog-zephyrus-g16', 'Asus', 'Asus ROG Zephyrus G16 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Asus', cat_laptops, '2879527718156')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Asus%20ROG%20Zephyrus%20G16', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2807.35, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Asus%20ROG%20Zephyrus%20G16', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2569.41, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Asus%20ROG%20Zephyrus%20G16', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2708.17, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Asus%20ROG%20Zephyrus%20G16', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2537.54, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Asus%20ROG%20Zephyrus%20G16', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2596.06, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Asus%20ROG%20Zephyrus%20G16', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2796.1, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Asus ZenBook S 16', 'asus-zenbook-s-16', 'Asus', 'Asus ZenBook S 16 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Asus', cat_laptops, '2537448457479')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Asus%20ZenBook%20S%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1568.17, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Asus%20ZenBook%20S%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1603.57, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Asus%20ZenBook%20S%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1655.8, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Asus%20ZenBook%20S%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1345.09, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Asus%20ZenBook%20S%2016', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1451.25, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Asus%20ZenBook%20S%2016', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1446.6, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Microsoft Surface Laptop 7', 'microsoft-surface-laptop-7', 'Microsoft', 'Microsoft Surface Laptop 7 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Microsoft', cat_laptops, '2860603160109')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Microsoft%20Surface%20Laptop%207', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1347.96, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Microsoft%20Surface%20Laptop%207', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1450.16, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Microsoft%20Surface%20Laptop%207', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1403.47, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Microsoft%20Surface%20Laptop%207', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1386.38, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Microsoft%20Surface%20Laptop%207', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1136.62, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Samsung Galaxy Book4 Ultra', 'samsung-galaxy-book4-ultra', 'Samsung', 'Samsung Galaxy Book4 Ultra - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Samsung', cat_laptops, '2528094498622')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Samsung%20Galaxy%20Book4%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2490.57, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Samsung%20Galaxy%20Book4%20Ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3060.92, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Samsung%20Galaxy%20Book4%20Ultra', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2648.11, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Samsung%20Galaxy%20Book4%20Ultra', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3078.6, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Acer Swift Go 16', 'acer-swift-go-16', 'Acer', 'Acer Swift Go 16 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Acer', cat_laptops, '2402565444244')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Acer%20Swift%20Go%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1110.51, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Acer%20Swift%20Go%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 919.73, 'CHF', NOW() - INTERVAL '13 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Acer%20Swift%20Go%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1066.63, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Acer%20Swift%20Go%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 902.79, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Acer%20Swift%20Go%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 876.57, 'CHF', NOW() - INTERVAL '3 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Acer%20Swift%20Go%2016', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1088.41, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Framework 16', 'framework-16', 'Framework', 'Framework 16 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Framework', cat_laptops, '2768981536983')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Framework%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1955.38, 'CHF', NOW() - INTERVAL '7 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Framework%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1934.97, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Framework%2016', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1773.99, 'CHF', NOW() - INTERVAL '1 days');

  -- KAMERAS
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony A7 V', 'sony-a7-v', 'Sony', 'Sony A7 V - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_kameras, '2410631399795')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sony%20A7%20V', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3230.93, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sony%20A7%20V', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3085.63, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sony%20A7%20V', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3353.18, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sony%20A7%20V', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3801.15, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20A7%20V', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3884.08, 'CHF', NOW() - INTERVAL '0 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony A7R V', 'sony-a7r-v', 'Sony', 'Sony A7R V - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_kameras, '2492046581473')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sony%20A7R%20V', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4824.35, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sony%20A7R%20V', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4899.9, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sony%20A7R%20V', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4711.98, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sony%20A7R%20V', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4393.93, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20A7R%20V', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4236.12, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sony%20A7R%20V', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4417.85, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony A6700', 'sony-a6700', 'Sony', 'Sony A6700 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_kameras, '2278578618570')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sony%20A6700', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1627.44, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sony%20A6700', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1426.89, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Sony%20A6700', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1344.85, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sony%20A6700', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1617.07, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20A6700', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1437.68, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sony%20A6700', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1308.56, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Sony ZV-E10 II', 'sony-zv-e10-ii', 'Sony', 'Sony ZV-E10 II - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Sony', cat_kameras, '2489522932205')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Sony%20ZV-E10%20II', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 935.46, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Sony%20ZV-E10%20II', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1084.82, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Sony%20ZV-E10%20II', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1240.15, 'CHF', NOW() - INTERVAL '16 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Sony%20ZV-E10%20II', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1169.92, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Sony%20ZV-E10%20II', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1114.67, 'CHF', NOW() - INTERVAL '19 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Canon EOS R6 Mark III', 'canon-eos-r6-mark-iii', 'Canon', 'Canon EOS R6 Mark III - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Canon', cat_kameras, '2765388301157')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Canon%20EOS%20R6%20Mark%20III', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2653.19, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Canon%20EOS%20R6%20Mark%20III', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3180.1, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Canon%20EOS%20R6%20Mark%20III', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3407.58, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Canon%20EOS%20R6%20Mark%20III', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3026, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Canon%20EOS%20R6%20Mark%20III', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3055.86, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Canon%20EOS%20R6%20Mark%20III', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3023.79, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Canon EOS R5 Mark II', 'canon-eos-r5-mark-ii', 'Canon', 'Canon EOS R5 Mark II - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Canon', cat_kameras, '2278827811251')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Canon%20EOS%20R5%20Mark%20II', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4442.86, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Canon%20EOS%20R5%20Mark%20II', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3918.85, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Canon%20EOS%20R5%20Mark%20II', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 5128.2, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Canon%20EOS%20R5%20Mark%20II', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4552.31, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Canon%20EOS%20R5%20Mark%20II', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 5099.91, 'CHF', NOW() - INTERVAL '12 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Canon EOS R100', 'canon-eos-r100', 'Canon', 'Canon EOS R100 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Canon', cat_kameras, '2465108538007')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Canon%20EOS%20R100', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 566.45, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Canon%20EOS%20R100', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 471.07, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Canon%20EOS%20R100', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 489.19, 'CHF', NOW() - INTERVAL '25 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Canon%20EOS%20R100', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 530.57, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Nikon Z6 III', 'nikon-z6-iii', 'Nikon', 'Nikon Z6 III - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Nikon', cat_kameras, '2506664111424')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Nikon%20Z6%20III', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2516.71, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Nikon%20Z6%20III', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2955.16, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Nikon%20Z6%20III', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2562.6, 'CHF', NOW() - INTERVAL '18 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Nikon%20Z6%20III', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3168.85, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Nikon%20Z6%20III', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2476.42, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Nikon%20Z6%20III', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3017.53, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Nikon Z8', 'nikon-z8', 'Nikon', 'Nikon Z8 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Nikon', cat_kameras, '2126166018516')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Nikon%20Z8', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3817.84, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Nikon%20Z8', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4152.56, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Nikon%20Z8', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 3925.4, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Nikon%20Z8', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4350.45, 'CHF', NOW() - INTERVAL '22 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Nikon%20Z8', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 4040.94, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Fujifilm X-T6', 'fujifilm-x-t6', 'Fujifilm', 'Fujifilm X-T6 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Fujifilm', cat_kameras, '2859894652505')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Fujifilm%20X-T6', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1772.29, 'CHF', NOW() - INTERVAL '9 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Fujifilm%20X-T6', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1806.08, 'CHF', NOW() - INTERVAL '15 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Fujifilm%20X-T6', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1748.38, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Fujifilm%20X-T6', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2062.67, 'CHF', NOW() - INTERVAL '29 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Fujifilm%20X-T6', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1891.28, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Fujifilm X100 VI', 'fujifilm-x100-vi', 'Fujifilm', 'Fujifilm X100 VI - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Fujifilm', cat_kameras, '2013162850963')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Fujifilm%20X100%20VI', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1589.32, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Fujifilm%20X100%20VI', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1452.85, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Fujifilm%20X100%20VI', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1796.37, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Fujifilm%20X100%20VI', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1729.61, 'CHF', NOW() - INTERVAL '5 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Fujifilm%20X100%20VI', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1447.02, 'CHF', NOW() - INTERVAL '8 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Fujifilm%20X100%20VI', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1764.7, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Leica Q3 43', 'leica-q3-43', 'Leica', 'Leica Q3 43 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Leica', cat_kameras, '2602271109665')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Leica%20Q3%2043', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 7891.42, 'CHF', NOW() - INTERVAL '20 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Leica%20Q3%2043', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 7229.6, 'CHF', NOW() - INTERVAL '6 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Leica%20Q3%2043', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 7460.93, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('DJI Osmo Pocket 3', 'dji-osmo-pocket-3', 'DJI', 'DJI Osmo Pocket 3 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=DJI', cat_kameras, '2456559642648')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=DJI%20Osmo%20Pocket%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 522.4, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=DJI%20Osmo%20Pocket%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 427.14, 'CHF', NOW() - INTERVAL '4 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=DJI%20Osmo%20Pocket%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 500.4, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=DJI%20Osmo%20Pocket%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 513.48, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=DJI%20Osmo%20Pocket%203', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 443.74, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('GoPro Hero 13 Black', 'gopro-hero-13-black', 'GoPro', 'GoPro Hero 13 Black - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=GoPro', cat_kameras, '2666699889254')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=GoPro%20Hero%2013%20Black', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 393.16, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=GoPro%20Hero%2013%20Black', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 449.01, 'CHF', NOW() - INTERVAL '23 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=GoPro%20Hero%2013%20Black', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 428.87, 'CHF', NOW() - INTERVAL '17 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=GoPro%20Hero%2013%20Black', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 421.15, 'CHF', NOW() - INTERVAL '24 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=GoPro%20Hero%2013%20Black', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 453.99, 'CHF', NOW() - INTERVAL '26 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=GoPro%20Hero%2013%20Black', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 478.84, 'CHF', NOW() - INTERVAL '10 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Insta360 X4', 'insta360-x4', 'Insta360', 'Insta360 X4 - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Insta360', cat_kameras, '2636150074109')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Insta360%20X4', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 570.55, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Insta360%20X4', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 424.59, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'microspot'), 'https://www.microspot.ch/search?q=Insta360%20X4', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 459.87, 'CHF', NOW() - INTERVAL '14 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Insta360%20X4', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 500.31, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Insta360%20X4', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 556.53, 'CHF', NOW() - INTERVAL '11 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Insta360%20X4', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 547.87, 'CHF', NOW() - INTERVAL '21 days');
  INSERT INTO products (name, slug, brand, description, image_url, category_id, ean)
    VALUES ('Panasonic Lumix S5 IIX', 'panasonic-lumix-s5-iix', 'Panasonic', 'Panasonic Lumix S5 IIX - Top Preis in der Schweiz. Jetzt vergleichen.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Panasonic', cat_kameras, '2199636218446')
    RETURNING id INTO prod_id;
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'galaxus'), 'https://www.galaxus.ch/en/search?q=Panasonic%20Lumix%20S5%20IIX', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1907.9, 'CHF', NOW() - INTERVAL '1 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'digitec'), 'https://www.digitec.ch/en/search?q=Panasonic%20Lumix%20S5%20IIX', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1884.06, 'CHF', NOW() - INTERVAL '27 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'brack'), 'https://www.brack.ch/search?q=Panasonic%20Lumix%20S5%20IIX', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1999.23, 'CHF', NOW() - INTERVAL '28 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'mediamarkt'), 'https://www.mediamarkt.ch/ch/de/search.html?query=Panasonic%20Lumix%20S5%20IIX', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 2068.61, 'CHF', NOW() - INTERVAL '2 days');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, (SELECT id FROM shops WHERE slug = 'interdiscount'), 'https://www.interdiscount.ch/search?q=Panasonic%20Lumix%20S5%20IIX', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, scraped_at) VALUES (ps_id, 1934.8, 'CHF', NOW() - INTERVAL '2 days');
END $$;
