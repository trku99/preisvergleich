-- Ürün varyantları için kolon ekle
ALTER TABLE products ADD COLUMN IF NOT EXISTS variant_of UUID REFERENCES products(id);

-- Varyantları güncelleme RPC
CREATE OR REPLACE FUNCTION admin_set_variant(p_product_id UUID, p_variant_of UUID)
RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN
  UPDATE products SET variant_of = p_variant_of WHERE id = p_product_id;
END;
$$ LANGUAGE plpgsql;

-- Varyantı kaldırma RPC
CREATE OR REPLACE FUNCTION admin_remove_variant(p_product_id UUID)
RETURNS void SECURITY DEFINER SET search_path = public AS $$
BEGIN
  UPDATE products SET variant_of = NULL WHERE id = p_product_id;
END;
$$ LANGUAGE plpgsql;
