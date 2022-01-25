Rails.application.routes.draw do
  root "homes#index"
  get "products",to: "products#index"
  get  "products/:id", to: "products#show", as: "show"
  get "/homes", to: "homes#index"
  resource :articles
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get "/add_to_cart/:product_id", to: "products#add_to_cart"
  get "/remove_to_cart/:product_id", to: "products#remove_to_cart"


  get "/add_to_wishlist/:product_id", to: "products#add_to_wishlist"
  get "/remove_to_wishlist/:product_id", to: "products#remove_to_wishlist"

  get "/search", to: "products#search"
  get "carts",to: "carts#index"
  get "wishlists",to: "wishlists#index"
  
  
  get "contacts", to: "contacts#index"
  get "shops", to: "shops#index"
  resource :contacts
  
end
