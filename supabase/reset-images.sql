-- Reset image_url to NULL so placehold.co fallback with product name shows
UPDATE products SET image_url = NULL;
