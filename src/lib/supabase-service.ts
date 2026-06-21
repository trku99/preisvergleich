import { supabase } from "./supabase"
import type { Product, Shop, Category } from "./types"

export async function getProducts(): Promise<Product[]> {
  const { data: products } = await supabase.from("products").select(`
    *,
    category:categories(name, slug),
    product_shops(
      *,
      shop:shops(name, slug, logo_url)
    )
  `)
  return (products || []) as unknown as Product[]
}

export async function getProductBySlug(slug: string): Promise<Product | null> {
  const { data } = await supabase
    .from("products")
    .select(`
      *,
      category:categories(name, slug),
      product_shops(
        *,
        shop:shops(name, slug, logo_url)
      )
    `)
    .eq("slug", slug)
    .single()
  return data as unknown as Product
}

export async function searchProducts(query: string): Promise<Product[]> {
  const { data } = await supabase
    .from("products")
    .select(`
      *,
      category:categories(name, slug),
      product_shops(
        *,
        shop:shops(name, slug, logo_url)
      )
    `)
    .ilike("name", `%${query}%`)
  return (data || []) as unknown as Product[]
}

export async function getProductsByCategory(categorySlug: string): Promise<Product[]> {
  const { data } = await supabase
    .from("products")
    .select(`
      *,
      category:categories(name, slug),
      product_shops(
        *,
        shop:shops(name, slug, logo_url)
      )
    `)
    .eq("category.slug", categorySlug)
  return (data || []) as unknown as Product[]
}

export async function getCategories(): Promise<Category[]> {
  const { data } = await supabase.from("categories").select("*")
  return (data || []) as unknown as Category[]
}

export async function getShopById(id: string): Promise<Shop | null> {
  const { data } = await supabase.from("shops").select("*").eq("id", id).single()
  return data as unknown as Shop
}
