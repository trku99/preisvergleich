-- Son 30 günden eski fiyat kayıtlarını siler
CREATE OR REPLACE FUNCTION admin_cleanup_old_prices(p_days INTEGER DEFAULT 30)
RETURNS INTEGER SECURITY DEFINER SET search_path = public AS $$
DECLARE
  deleted_count INTEGER;
BEGIN
  DELETE FROM price_history
  WHERE scraped_at < now() - (p_days || ' days')::INTERVAL;
  GET DIAGNOSTICS deleted_count = ROW_COUNT;
  RETURN deleted_count;
END;
$$ LANGUAGE plpgsql;
