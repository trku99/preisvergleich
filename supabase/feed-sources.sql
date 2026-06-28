-- Feed kaynakları tablosu
CREATE TABLE IF NOT EXISTS feed_sources (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  shop_id UUID REFERENCES shops(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  feed_url TEXT NOT NULL,
  feed_type TEXT NOT NULL DEFAULT 'xml',
  last_fetched_at TIMESTAMPTZ,
  last_status TEXT,
  last_error TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

ALTER TABLE feed_sources ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read feeds" ON feed_sources FOR SELECT USING (true);
CREATE POLICY "Public insert feeds" ON feed_sources FOR INSERT WITH CHECK (true);
CREATE POLICY "Public update feeds" ON feed_sources FOR UPDATE USING (true);
CREATE POLICY "Public delete feeds" ON feed_sources FOR DELETE USING (true);

-- Feed log tablosu
CREATE TABLE IF NOT EXISTS feed_import_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  feed_source_id UUID REFERENCES feed_sources(id) ON DELETE CASCADE,
  status TEXT NOT NULL,
  products_found INTEGER DEFAULT 0,
  products_imported INTEGER DEFAULT 0,
  products_updated INTEGER DEFAULT 0,
  error_message TEXT,
  started_at TIMESTAMPTZ DEFAULT now(),
  finished_at TIMESTAMPTZ
);

ALTER TABLE feed_import_logs ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read feed logs" ON feed_import_logs FOR SELECT USING (true);
CREATE POLICY "Public insert feed logs" ON feed_import_logs FOR INSERT WITH CHECK (true);

-- RPC: Feed kaynağı ekle
CREATE OR REPLACE FUNCTION admin_insert_feed_source(
  p_shop_id UUID, p_name TEXT, p_feed_url TEXT, p_feed_type TEXT
) RETURNS UUID SECURITY DEFINER SET search_path = public AS $$
DECLARE new_id UUID;
BEGIN
  INSERT INTO feed_sources (shop_id, name, feed_url, feed_type)
  VALUES (p_shop_id, p_name, p_feed_url, p_feed_type) RETURNING id INTO new_id;
  RETURN new_id;
END;
$$ LANGUAGE plpgsql;

-- RPC: Feed kaynağı güncelle
CREATE OR REPLACE FUNCTION admin_update_feed_source(
  p_id UUID, p_shop_id UUID, p_name TEXT, p_feed_url TEXT, p_feed_type TEXT, p_is_active BOOLEAN
) RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN
  UPDATE feed_sources SET shop_id = p_shop_id, name = p_name, feed_url = p_feed_url,
    feed_type = p_feed_type, is_active = p_is_active WHERE id = p_id;
END;
$$ LANGUAGE plpgsql;

-- RPC: Feed kaynağı sil
CREATE OR REPLACE FUNCTION admin_delete_feed_source(p_id UUID)
RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN DELETE FROM feed_sources WHERE id = p_id; END;
$$ LANGUAGE plpgsql;

-- RPC: Feed import log kaydet
CREATE OR REPLACE FUNCTION admin_insert_feed_log(
  p_feed_source_id UUID, p_status TEXT, p_products_found INTEGER,
  p_products_imported INTEGER, p_products_updated INTEGER, p_error_message TEXT
) RETURNS UUID SECURITY DEFINER SET search_path = public AS $$
DECLARE new_id UUID;
BEGIN
  INSERT INTO feed_import_logs (feed_source_id, status, products_found, products_imported, products_updated, error_message, finished_at)
  VALUES (p_feed_source_id, p_status, p_products_found, p_products_imported, p_products_updated, p_error_message, now())
  RETURNING id INTO new_id;
  RETURN new_id;
END;
$$ LANGUAGE plpgsql;
