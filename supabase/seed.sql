-- Insert Swiss shops
INSERT INTO shops (name, slug, base_url) VALUES
  ('Galaxus', 'galaxus', 'https://www.galaxus.ch'),
  ('Digitec', 'digitec', 'https://www.digitec.ch'),
  ('Microspot', 'microspot', 'https://www.microspot.ch'),
  ('Brack', 'brack', 'https://www.brack.ch'),
  ('MediaMarkt', 'mediamarkt', 'https://www.mediamarkt.ch'),
  ('Interdiscount', 'interdiscount', 'https://www.interdiscount.ch')
ON CONFLICT (slug) DO NOTHING;

-- Insert categories
INSERT INTO categories (name, slug, icon) VALUES
  ('Smartphones', 'smartphones', '📱'),
  ('Kopfhörer', 'kopfhorer', '🎧'),
  ('Gaming', 'gaming', '🎮'),
  ('Smartwatches', 'smartwatches', '⌚'),
  ('TV & Audio', 'tv-audio', '📺'),
  ('Haushalt', 'haushalt', '🏠')
ON CONFLICT (slug) DO NOTHING;

-- Insert products (using category slugs, not IDs)
DO $$
DECLARE
  cat_kopfhorer UUID;
  cat_smartphones UUID;
  cat_gaming UUID;
  cat_smartwatches UUID;
  cat_tv UUID;
  cat_haushalt UUID;
  shop_galaxus UUID;
  shop_digitec UUID;
  shop_microspot UUID;
  shop_brack UUID;
  shop_mediamarkt UUID;
  shop_interdiscount UUID;
  prod_id UUID;
  ps_id UUID;
BEGIN
  SELECT id INTO cat_kopfhorer FROM categories WHERE slug = 'kopfhorer';
  SELECT id INTO cat_smartphones FROM categories WHERE slug = 'smartphones';
  SELECT id INTO cat_gaming FROM categories WHERE slug = 'gaming';
  SELECT id INTO cat_smartwatches FROM categories WHERE slug = 'smartwatches';
  SELECT id INTO cat_tv FROM categories WHERE slug = 'tv-audio';
  SELECT id INTO cat_haushalt FROM categories WHERE slug = 'haushalt';
  
  SELECT id INTO shop_galaxus FROM shops WHERE slug = 'galaxus';
  SELECT id INTO shop_digitec FROM shops WHERE slug = 'digitec';
  SELECT id INTO shop_microspot FROM shops WHERE slug = 'microspot';
  SELECT id INTO shop_brack FROM shops WHERE slug = 'brack';
  SELECT id INTO shop_mediamarkt FROM shops WHERE slug = 'mediamarkt';
  SELECT id INTO shop_interdiscount FROM shops WHERE slug = 'interdiscount';

  -- Sony WH-1000XM5
  INSERT INTO products (name, slug, brand, description, image_url, ean, category_id) VALUES
    ('Sony WH-1000XM5 Kabellos Noise Cancelling', 'sony-wh-1000xm5', 'Sony', 'Industry-leading noise cancellation with Auto NC Optimizer. 30-hour battery life.', 'https://placehold.co/400x400/e2e8f0/64748b?text=XM5', '0272429237655', cat_kopfhorer)
  RETURNING id INTO prod_id;
  
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_digitec, 'https://www.digitec.ch/sony-xm5', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, is_promotion) VALUES (ps_id, 239, 'CHF', true);
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_galaxus, 'https://www.galaxus.ch/sony-xm5', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 249, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_microspot, 'https://www.microspot.ch/sony-xm5', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 259, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_brack, 'https://www.brack.ch/sony-xm5', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 264, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_mediamarkt, 'https://www.mediamarkt.ch/sony-xm5', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 279, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_interdiscount, 'https://www.interdiscount.ch/sony-xm5', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 329, 'CHF');

  -- Apple AirPods Pro 3
  INSERT INTO products (name, slug, brand, description, image_url, ean, category_id) VALUES
    ('Apple AirPods Pro 3 mit MagSafe', 'apple-airpods-pro-3', 'Apple', 'Adaptive Audio, Personalized Spatial Audio, and USB-C MagSafe charging case.', 'https://placehold.co/400x400/e2e8f0/64748b?text=AirPods+Pro+3', '0194256891234', cat_kopfhorer)
  RETURNING id INTO prod_id;
  
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_galaxus, 'https://www.galaxus.ch/airpods-pro-3', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, is_promotion) VALUES (ps_id, 199, 'CHF', true);
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_digitec, 'https://www.digitec.ch/airpods-pro-3', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 209, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_microspot, 'https://www.microspot.ch/airpods-pro-3', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 219, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_mediamarkt, 'https://www.mediamarkt.ch/airpods-pro-3', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 229, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_brack, 'https://www.brack.ch/airpods-pro-3', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 259, 'CHF');

  -- Samsung Galaxy S25 Ultra
  INSERT INTO products (name, slug, brand, description, image_url, ean, category_id) VALUES
    ('Samsung Galaxy S25 Ultra 256GB', 'samsung-galaxy-s25-ultra', 'Samsung', 'Galaxy AI, 200MP Kamera, S Pen integriert, 12GB RAM.', 'https://placehold.co/400x400/e2e8f0/64748b?text=S25+Ultra', '0880609332917', cat_smartphones)
  RETURNING id INTO prod_id;
  
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_digitec, 'https://www.digitec.ch/s25-ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 1049, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_galaxus, 'https://www.galaxus.ch/s25-ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 1079, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_microspot, 'https://www.microspot.ch/s25-ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 1099, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_brack, 'https://www.brack.ch/s25-ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 1129, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_mediamarkt, 'https://www.mediamarkt.ch/s25-ultra', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, is_promotion) VALUES (ps_id, 1149, 'CHF', true);
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_interdiscount, 'https://www.interdiscount.ch/s25-ultra', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 1299, 'CHF');

  -- Apple iPhone 17 Pro
  INSERT INTO products (name, slug, brand, description, image_url, ean, category_id) VALUES
    ('Apple iPhone 17 Pro 256GB', 'apple-iphone-17-pro', 'Apple', 'A19 Chip, 48MP Triple-Kamera, Titanium Design.', 'https://placehold.co/400x400/e2e8f0/64748b?text=iPhone+17+Pro', '0194265738291', cat_smartphones)
  RETURNING id INTO prod_id;
  
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_galaxus, 'https://www.galaxus.ch/iphone-17-pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 1199, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_digitec, 'https://www.digitec.ch/iphone-17-pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 1229, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_microspot, 'https://www.microspot.ch/iphone-17-pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 1249, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_brack, 'https://www.brack.ch/iphone-17-pro', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 1279, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_mediamarkt, 'https://www.mediamarkt.ch/iphone-17-pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, is_promotion) VALUES (ps_id, 1299, 'CHF', true);
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_interdiscount, 'https://www.interdiscount.ch/iphone-17-pro', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 1449, 'CHF');

  -- Nintendo Switch 2
  INSERT INTO products (name, slug, brand, description, image_url, ean, category_id) VALUES
    ('Nintendo Switch 2', 'nintendo-switch-2', 'Nintendo', 'Next-gen gaming mit 7.9 Zoll Display, 4K Output.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Switch+2', '045496454321', cat_gaming)
  RETURNING id INTO prod_id;
  
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_digitec, 'https://www.digitec.ch/switch-2', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 339, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_galaxus, 'https://www.galaxus.ch/switch-2', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 349, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_microspot, 'https://www.microspot.ch/switch-2', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 359, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_brack, 'https://www.brack.ch/switch-2', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 379, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_mediamarkt, 'https://www.mediamarkt.ch/switch-2', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 429, 'CHF');

  -- Apple Watch Ultra 3
  INSERT INTO products (name, slug, brand, description, image_url, ean, category_id) VALUES
    ('Apple Watch Ultra 3 GPS + Cellular', 'apple-watch-ultra-3', 'Apple', '49mm Titanium, Precision Dual-Frequency GPS, 36h Battery.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Watch+Ultra+3', '0194265918273', cat_smartwatches)
  RETURNING id INTO prod_id;
  
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_digitec, 'https://www.digitec.ch/watch-ultra-3', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 699, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_galaxus, 'https://www.galaxus.ch/watch-ultra-3', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 719, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_microspot, 'https://www.microspot.ch/watch-ultra-3', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 749, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_brack, 'https://www.brack.ch/watch-ultra-3', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 849, 'CHF');

  -- Dyson V15 Detect
  INSERT INTO products (name, slug, brand, description, image_url, ean, category_id) VALUES
    ('Dyson V15 Detect Staubsauger', 'dyson-v15-detect', 'Dyson', 'Laser detection, Piezo-Sensor, 60 Minuten Laufzeit.', 'https://placehold.co/400x400/e2e8f0/64748b?text=Dyson+V15', '0885294562391', cat_haushalt)
  RETURNING id INTO prod_id;
  
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_galaxus, 'https://www.galaxus.ch/dyson-v15', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, is_promotion) VALUES (ps_id, 499, 'CHF', true);
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_digitec, 'https://www.digitec.ch/dyson-v15', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 529, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_brack, 'https://www.brack.ch/dyson-v15', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 549, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_microspot, 'https://www.microspot.ch/dyson-v15', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 579, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_mediamarkt, 'https://www.mediamarkt.ch/dyson-v15', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 649, 'CHF');

  -- LG OLED C4
  INSERT INTO products (name, slug, brand, description, image_url, ean, category_id) VALUES
    ('LG OLED C4 65 Zoll 4K TV', 'lg-oled-c4-65', 'LG', 'OLED evo, a9 AI Prozessor, Dolby Vision, 120Hz.', 'https://placehold.co/400x400/e2e8f0/64748b?text=LG+OLED+C4', '0880609330128', cat_tv)
  RETURNING id INTO prod_id;
  
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_digitec, 'https://www.digitec.ch/lg-oled-c4', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 1299, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_galaxus, 'https://www.galaxus.ch/lg-oled-c4', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 1349, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_microspot, 'https://www.microspot.ch/lg-oled-c4', false) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 1399, 'CHF');
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_mediamarkt, 'https://www.mediamarkt.ch/lg-oled-c4', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency, is_promotion) VALUES (ps_id, 1449, 'CHF', true);
  INSERT INTO product_shops (product_id, shop_id, product_url, in_stock) VALUES (prod_id, shop_interdiscount, 'https://www.interdiscount.ch/lg-oled-c4', true) RETURNING id INTO ps_id;
  INSERT INTO price_history (product_shop_id, price, currency) VALUES (ps_id, 1599, 'CHF');

END $$;
