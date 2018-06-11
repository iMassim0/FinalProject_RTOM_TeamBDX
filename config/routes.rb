Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :products
  resources :order_items
  resource :carts, only: [:show]
  get '/atelier',                   to: "pages#shop",       as: :shop
  get '/informations',              to: "carts#require",    as: :require
  patch '/paiement',                to: "carts#payment",    as: :payment
  post "/paiement/stripe",          to: "carts#pay"
  get "/profil",                    to: "user#profile",     as: :profile
  get "/livre",                     to: "book#index",       as: :book
  get "/personnages",               to: "pages#characters", as: :characters
  get '/itineraire',                to: "pages#trip",       as: :trip
  get '/temoignages',               to: "posts#index",      as: :blog
  resources :posts
  post "/posts/:post_id/comments",  to: 'comments#create',  as: :post_comments
  get "/bienvenue",                 to: 'pages#landing',    as: :landing
  post '/panier/:id',               to: "carts#update",     as: :adding

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
