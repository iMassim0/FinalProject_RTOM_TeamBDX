Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :products
  resources :order_items
  resource :carts, only: [:show]
  patch '/product/publish/:id',     to: "products#set_publish",     as: :publish
  patch '/product/unpublish/:id',   to: "products#set_unpublish",   as: :unpublish
  get '/atelier',                   to: "pages#shop",               as: :shop
  get '/informations',              to: "carts#require",            as: :require
  patch '/paiement',                to: "carts#payment",            as: :payment
  post "/paiement/stripe",          to: "carts#pay"
  patch "/comment",                 to: "comments#create_comment",  as: :comment
  get "/profil",                    to: "user#profile",             as: :profile
  get "/livre",                     to: "book#index",               as: :book
  get "/personnages",               to: "pages#characters",         as: :characters
  get '/itineraire',                to: "pages#trip",               as: :trip
  get '/temoignages',               to: "posts#index",              as: :blog
  resources :posts
  post "/posts/:post_id/comments",  to: 'comments#create',          as: :post_comments
  get "/bienvenue",                 to: 'pages#landing',            as: :landing
  post '/panier/:id',               to: "carts#update",             as: :adding
  get '/admin/users',               to: "user#index",               as: :admin_users
  patch '/admin/set_admin/:id',     to: "user#set_admin",           as: :set_admin
  patch '/admin/unset_admin/:id',   to: "user#unset_admin",         as: :unset_admin
  delete '/del/:user_id',           to: "registrations#cancel",     as: :del_user
  get '/admin/orders',              to: "user#orders",              as: :admin_orders
  get '/locations',                 to: 'pages#locations'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
