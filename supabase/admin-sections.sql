-- Yönetici Hesapları tablosu
CREATE TABLE IF NOT EXISTS admin_accounts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE UNIQUE,
  role TEXT NOT NULL DEFAULT 'admin',
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT now()
);

ALTER TABLE admin_accounts ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Admin read own" ON admin_accounts FOR SELECT USING (true);

-- Ürün Yorumları tablosu
CREATE TABLE IF NOT EXISTS product_reviews (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id UUID REFERENCES products(id) ON DELETE CASCADE,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
  title TEXT,
  comment TEXT,
  is_approved BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(product_id, user_id)
);

ALTER TABLE product_reviews ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read reviews" ON product_reviews FOR SELECT USING (true);
CREATE POLICY "Users insert own review" ON product_reviews FOR INSERT WITH CHECK (auth.uid() = user_id);

-- Bildirimler tablosu
CREATE TABLE IF NOT EXISTS notifications (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  type TEXT NOT NULL DEFAULT 'system',
  title TEXT NOT NULL,
  message TEXT,
  link TEXT,
  is_read BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now()
);

ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users read own notifications" ON notifications FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users update own notifications" ON notifications FOR UPDATE USING (auth.uid() = user_id);

-- Reklam Yönetimi tablosu
CREATE TABLE IF NOT EXISTS ad_placements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  position TEXT NOT NULL,
  image_url TEXT,
  link_url TEXT,
  is_active BOOLEAN DEFAULT true,
  start_date TIMESTAMPTZ,
  end_date TIMESTAMPTZ,
  impressions INTEGER DEFAULT 0,
  clicks INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now()
);

ALTER TABLE ad_placements ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read ads" ON ad_placements FOR SELECT USING (true);

-- RPC: Admin hesap ekle
CREATE OR REPLACE FUNCTION admin_insert_admin_account(p_user_id UUID, p_role TEXT)
RETURNS UUID SECURITY DEFINER SET search_path = public AS $$
DECLARE new_id UUID;
BEGIN
  INSERT INTO admin_accounts (user_id, role) VALUES (p_user_id, p_role) RETURNING id INTO new_id;
  RETURN new_id;
END;
$$ LANGUAGE plpgsql;

-- RPC: Admin hesap güncelle
CREATE OR REPLACE FUNCTION admin_update_admin_account(p_id UUID, p_role TEXT, p_is_active BOOLEAN)
RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN
  UPDATE admin_accounts SET role = p_role, is_active = p_is_active WHERE id = p_id;
END;
$$ LANGUAGE plpgsql;

-- RPC: Admin hesap sil
CREATE OR REPLACE FUNCTION admin_delete_admin_account(p_id UUID)
RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN DELETE FROM admin_accounts WHERE id = p_id; END;
$$ LANGUAGE plpgsql;

-- RPC: Yorum onayla/reddet
CREATE OR REPLACE FUNCTION admin_update_review(p_id UUID, p_is_approved BOOLEAN)
RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN
  UPDATE product_reviews SET is_approved = p_is_approved WHERE id = p_id;
END;
$$ LANGUAGE plpgsql;

-- RPC: Yorum sil
CREATE OR REPLACE FUNCTION admin_delete_review(p_id UUID)
RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN DELETE FROM product_reviews WHERE id = p_id; END;
$$ LANGUAGE plpgsql;

-- RPC: Bildirim ekle
CREATE OR REPLACE FUNCTION admin_insert_notification(p_user_id UUID, p_type TEXT, p_title TEXT, p_message TEXT, p_link TEXT)
RETURNS UUID SECURITY DEFINER SET search_path = public AS $$
DECLARE new_id UUID;
BEGIN
  INSERT INTO notifications (user_id, type, title, message, link) VALUES (p_user_id, p_type, p_title, p_message, p_link) RETURNING id INTO new_id;
  RETURN new_id;
END;
$$ LANGUAGE plpgsql;

-- RPC: Bildirim sil
CREATE OR REPLACE FUNCTION admin_delete_notification(p_id UUID)
RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN DELETE FROM notifications WHERE id = p_id; END;
$$ LANGUAGE plpgsql;

-- RPC: Reklam ekle
CREATE OR REPLACE FUNCTION admin_insert_ad(p_name TEXT, p_position TEXT, p_image_url TEXT, p_link_url TEXT, p_start_date TIMESTAMPTZ, p_end_date TIMESTAMPTZ)
RETURNS UUID SECURITY DEFINER SET search_path = public AS $$
DECLARE new_id UUID;
BEGIN
  INSERT INTO ad_placements (name, position, image_url, link_url, start_date, end_date)
  VALUES (p_name, p_position, p_image_url, p_link_url, p_start_date, p_end_date) RETURNING id INTO new_id;
  RETURN new_id;
END;
$$ LANGUAGE plpgsql;

-- RPC: Reklam güncelle
CREATE OR REPLACE FUNCTION admin_update_ad(p_id UUID, p_name TEXT, p_position TEXT, p_image_url TEXT, p_link_url TEXT, p_is_active BOOLEAN, p_start_date TIMESTAMPTZ, p_end_date TIMESTAMPTZ)
RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN
  UPDATE ad_placements SET name = p_name, position = p_position, image_url = p_image_url, link_url = p_link_url, is_active = p_is_active, start_date = p_start_date, end_date = p_end_date WHERE id = p_id;
END;
$$ LANGUAGE plpgsql;

-- RPC: Reklam sil
CREATE OR REPLACE FUNCTION admin_delete_ad(p_id UUID)
RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN DELETE FROM ad_placements WHERE id = p_id; END;
$$ LANGUAGE plpgsql;
