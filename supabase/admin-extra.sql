-- Kampanyalar tablosu
CREATE TABLE IF NOT EXISTS campaigns (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  description TEXT,
  discount_percent INTEGER,
  start_date TIMESTAMPTZ,
  end_date TIMESTAMPTZ,
  is_active BOOLEAN DEFAULT true,
  banner_url TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

ALTER TABLE campaigns ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read campaigns" ON campaigns FOR SELECT USING (true);

-- CMS sayfaları tablosu
CREATE TABLE IF NOT EXISTS cms_pages (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  content TEXT,
  meta_title TEXT,
  meta_description TEXT,
  is_published BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

ALTER TABLE cms_pages ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read cms" ON cms_pages FOR SELECT USING (true);

-- Aktivite log tablosu
CREATE TABLE IF NOT EXISTS activity_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id),
  action TEXT NOT NULL,
  entity_type TEXT,
  entity_id TEXT,
  details JSONB,
  ip_address TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

ALTER TABLE activity_logs ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Admin read logs" ON activity_logs FOR SELECT USING (true);

-- Campaign RPC
CREATE OR REPLACE FUNCTION admin_insert_campaign(
  p_title TEXT, p_slug TEXT, p_description TEXT, p_discount_percent INTEGER,
  p_start_date TIMESTAMPTZ, p_end_date TIMESTAMPTZ, p_banner_url TEXT
) RETURNS UUID SECURITY DEFINER SET search_path = public AS $$
DECLARE new_id UUID;
BEGIN
  INSERT INTO campaigns (title, slug, description, discount_percent, start_date, end_date, banner_url)
  VALUES (p_title, p_slug, p_description, p_discount_percent, p_start_date, p_end_date, p_banner_url)
  RETURNING id INTO new_id;
  RETURN new_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION admin_update_campaign(
  p_id UUID, p_title TEXT, p_slug TEXT, p_description TEXT, p_discount_percent INTEGER,
  p_start_date TIMESTAMPTZ, p_end_date TIMESTAMPTZ, p_is_active BOOLEAN, p_banner_url TEXT
) RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN
  UPDATE campaigns SET title = p_title, slug = p_slug, description = p_description,
    discount_percent = p_discount_percent, start_date = p_start_date, end_date = p_end_date,
    is_active = p_is_active, banner_url = p_banner_url
  WHERE id = p_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION admin_delete_campaign(p_id UUID)
RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN DELETE FROM campaigns WHERE id = p_id; END;
$$ LANGUAGE plpgsql;

-- CMS RPC
CREATE OR REPLACE FUNCTION admin_insert_cms_page(
  p_title TEXT, p_slug TEXT, p_content TEXT, p_meta_title TEXT, p_meta_description TEXT
) RETURNS UUID SECURITY DEFINER SET search_path = public AS $$
DECLARE new_id UUID;
BEGIN
  INSERT INTO cms_pages (title, slug, content, meta_title, meta_description)
  VALUES (p_title, p_slug, p_content, p_meta_title, p_meta_description)
  RETURNING id INTO new_id;
  RETURN new_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION admin_update_cms_page(
  p_id UUID, p_title TEXT, p_slug TEXT, p_content TEXT,
  p_meta_title TEXT, p_meta_description TEXT, p_is_published BOOLEAN
) RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN
  UPDATE cms_pages SET title = p_title, slug = p_slug, content = p_content,
    meta_title = p_meta_title, meta_description = p_meta_description,
    is_published = p_is_published, updated_at = now()
  WHERE id = p_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION admin_delete_cms_page(p_id UUID)
RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN DELETE FROM cms_pages WHERE id = p_id; END;
$$ LANGUAGE plpgsql;
