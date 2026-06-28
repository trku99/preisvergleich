CREATE OR REPLACE FUNCTION admin_chart_stats()
RETURNS JSONB SECURITY DEFINER SET search_path = public AS $$
DECLARE
  result JSONB;
BEGIN
  SELECT jsonb_build_object(
    'price_trend', COALESCE(
      (SELECT jsonb_agg(jsonb_build_object('date', d::DATE, 'count', COALESCE(cnt, 0)) ORDER BY d)
       FROM generate_series(CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE, '1 day') d
       LEFT JOIN (SELECT scraped_at::DATE as day, COUNT(*)::int as cnt FROM price_history WHERE scraped_at >= CURRENT_DATE - INTERVAL '30 days' GROUP BY day) ph ON ph.day = d),
      '[]'::jsonb
    ),
    'category_distribution', COALESCE(
      (SELECT jsonb_agg(jsonb_build_object('name', c.name, 'count', COUNT(p.id)::int))
       FROM categories c LEFT JOIN products p ON p.category_id = c.id GROUP BY c.id, c.name ORDER BY COUNT(p.id) DESC),
      '[]'::jsonb
    ),
    'brand_distribution', COALESCE(
      (SELECT jsonb_agg(jsonb_build_object('name', brand, 'count', COUNT(*)::int))
       FROM products WHERE brand IS NOT NULL GROUP BY brand ORDER BY COUNT(*) DESC LIMIT 10),
      '[]'::jsonb
    )
  ) INTO result;
  RETURN result;
END;
$$ LANGUAGE plpgsql;
