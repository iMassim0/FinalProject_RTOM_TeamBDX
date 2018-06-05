Rails.application.routes.draw do
<<<<<<< HEAD
  resources :products
  resources :order_items
  resource :carts, only: [:show]
  get '/shop', to: "pages#shop", as: :shop
=======
  root 'pages#home'
  devise_for :users
>>>>>>> 68a9431ab2e505983d6207c89dea63c50cd9d1e5
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
