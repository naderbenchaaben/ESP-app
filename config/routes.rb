Rails.application.routes.draw do
  
  
  
  namespace :admin do
      resources :users
      resources :orders
      resources :ratings
      resources :companies
      resources :products
      resources :categories
      resources :comments
      resources :fieldofbusinesses
      resources :images
      resources :order_items

      root to: "users#index"
    end
  devise_for :users, controllers: { registrations: 'registrations' }
  
  namespace :api do
    namespace :v1 do
      resources :users
      resources :sessions, only: [:create]
      delete :logout, to: "sessions#logout"
      get :logged_in, to: "sessions#logged_in"
      get 'post/index'
      post :auth, to: 'authentication#create'
      get  '/auth' => 'authentication#fetch'
    end
    namespace :v2 do
      resources :images
      resources :categories
      get '/categoryC/:company_id', to: 'categories#show_category'
      resources :orders
      get '/order/:company_id', to: 'orders#show_orders'
      get '/p/:company_id', to: 'products#show_product'
      put '/o/:id', to: 'orders#updatestage'
      
      resources :products
      resources :companies, param: :user_id
      put '/userimage/:id' ,to: 'users#uploadimageuser'
      put '/companyimage/:id' ,to: 'companies#uploadimage'
      get '/users/:city', to: 'users#show_costomer'
      get '/customer', to: 'users#get_customer'
      get '/user/:id' , to: 'users#show'
      get 'oldusers/:company_id' , to: 'users#oldusers'
      get 'avgscore/:product_id' , to: 'ratings#avgrating'
      #get "/company/:user_id", to: "companies#showcomp" , as: 'companyy'
      resources :ratings
      resources :orderitems
      resources :fieldofbusiness
      get 'orderitem/:order_id', to: 'orderitems#show_orderitems'
      get '/comment/:product_id', to: 'comments#show_comments'

    end
    namespace :v3 do
     
      resources :orders
      resources :companies
      get 'products/:company_id' , to: 'products#show_products'
      resources :categories
      get 'category/:company_id' , to: 'categories#show_categories'
      get 'comp/:id' , to: 'companies#getcompany'
      resources :fieldofbusiness
      resources :products
      get '/prod/:id', to: 'products#getprod'
      get 'avgrating/:product_id' , to: 'ratings#avgrating'
      get 'nbrproduct/:company_id' , to: 'products#countproducts'
      get '/comment/:product_id', to: 'comments#show_comments'
      get '/commande/:user_id', to: 'orders#show_orders'
      resources :orderitems
      resources :ratings
      resources :comments
    end
    
  
  end
end