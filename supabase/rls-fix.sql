-- Allow anon key to insert price history (for the price updater)
CREATE POLICY "anon insert" ON price_history FOR INSERT WITH CHECK (true);

-- Allow anon key to update product_shops
CREATE POLICY "anon update" ON product_shops FOR UPDATE USING (true);
