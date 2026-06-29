-- Galaxus/Digitec gerçek fiyat entegrasyonu için kolonlar
ALTER TABLE products ADD COLUMN IF NOT EXISTS galaxus_id TEXT;
ALTER TABLE products ADD COLUMN IF NOT EXISTS galaxus_price DECIMAL(10,2);
ALTER TABLE products ADD COLUMN IF NOT EXISTS galaxus_currency TEXT DEFAULT 'CHF';
ALTER TABLE products ADD COLUMN IF NOT EXISTS galaxus_in_stock BOOLEAN DEFAULT FALSE;
ALTER TABLE products ADD COLUMN IF NOT EXISTS galaxus_updated_at TIMESTAMPTZ;
