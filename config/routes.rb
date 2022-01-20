Rails.application.routes.draw do
  root "products#index"
  get "products",to: "products#index"
  get  "products/:id", to: "products#show", as: "show"
  get "/articles", to: "articles#index"
  resource :articles
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get "/add_to_cart/:product_id", to: "products#add_to_cart"
  get "/remove_to_cart/:product_id", to: "products#remove_to_cart"

  get "/add_to_wishlist/:product_id", to: "products#add_to_wishlist"
  get "/remove_to_wishlist/:product_id", to: "products#remove_to_wishlist"

  get "carts",to: "carts#index"
  get "wishlists",to: "wishlists#index"
  get "buys",to: "buys#index"
  get "categorys", to: "categorys#index"
  get "contacts", to: "contacts#index"
  get "shops", to: "shops#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
