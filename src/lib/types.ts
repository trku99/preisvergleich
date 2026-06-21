export interface Shop {
  id: string
  name: string
  slug: string
  logo: string
  rating: number
  deliveryCost: number
  deliveryTime: string
}

export interface Price {
  shopId: string
  price: number
  currency: string
  isPromotion: boolean
  inStock: boolean
  url: string
  updatedAt: string
}

export interface PriceHistory {
  date: string
  price: number
  shopId: string
}

export interface Product {
  id: string
  name: string
  slug: string
  description: string
  image: string
  brand: string
  category: string
  categorySlug: string
  ean: string
  lowestPrice: number
  highestPrice: number
  currency: string
  shopCount: number
  prices: Price[]
  priceHistory: PriceHistory[]
}

export interface Category {
  name: string
  slug: string
  icon: string
  productCount: number
}
