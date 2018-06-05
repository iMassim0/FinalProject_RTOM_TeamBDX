Rails.application.routes.draw do
  resources :products
  resources :order_items
  resource :carts, only: [:show]
  get '/shop', to: "pages#shop", as: :shop
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
