Rails.application.routes.draw do
  resources :products
  resources :order_items
  resource :carts, only: [:show]
  get '/shop', to: "pages#shop", as: :shop
  get '/informations', to: "carts#require", as: :require
  get '/payment', to: "carts#payment", as: :payment
  post "/payment/stripe", to: "carts#pay"
  root 'pages#home'
  get "/profile", to: "user#profile", as: :profile
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
