Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root "homes#index"
  get "products",to: "products#index"
  get  "products/:id", to: "products#show", as: "show"
  get "/homes", to: "homes#index"
  get "/categorys", to: "categorys#index"
  resource :articles
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  devise_for :users
  get "/add_to_cart/:product_id", to: "products#add_to_cart"
  get "/remove_to_cart/:product_id", to: "products#remove_to_cart"
  get "/cart_clear", to: "products#cart_clear"


  get "/add_to_wishlist/:product_id", to: "products#add_to_wishlist"
  get "/remove_to_wishlist/:product_id", to: "products#remove_to_wishlist"

  get "/add_to_dolike/:product_id", to: "products#add_to_dolike"
  get "/remove_to_dolike/:product_id", to: "products#remove_to_dolike"


  get "/search", to: "products#search"
  get "carts",to: "carts#index"
  get "wishlists",to: "wishlists#index"
  get "dolikes",to: "dolikes#index"
  
  
  get "contacts", to: "contacts#index"
  get "shops", to: "shops#index"

  post "/create-checkout-session", to: "carts#checkout"

  get "/carts/success", to: "carts#success"
  get "/carts/cancel", to: "carts#cancel"
  get "/success", to: "carts#success_page"
  
  resource :contacts

  # match '/auth/:provider/callback', :to => 'sessions#create', via: [:get, :post]
  # match '/auth/:provider/callback', :to => 'sessions#create'

  match '/auth/:provider/callback', :to => 'sessions#create', via: [:get, :post]
  match '/auth/failure', :to => 'sessions#failure', via: [:get, :post]
  
end
