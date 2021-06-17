Rails.application.routes.draw do
  
  namespace :admin do
      resources :users
      resources :orders
      resources :images
      resources :ratings
      resources :companies
      resources :categories
      resources :products

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
      resources :orders
      get '/order/:company_id', to: 'orders#show_orders'
      resources :products
      resources :companies, param: :user_id
      get '/users/:city', to: 'users#show_costomer'
      get '/user/:id' , to: 'users#show'
      get 'oldusers/:company_id' , to: 'users#oldusers'
      #get "/company/:user_id", to: "companies#showcomp" , as: 'companyy'
      resources :ratings
      resources :orderitems
      get 'orderitem/:order_id', to: 'orderitems#show_orderitems'
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
      get 'avgrating/:product_id' , to: 'ratings#avgrating'
      get '/comment/:product_id', to: 'comments#show_comments'
    end
    namespace :v3 do
     
      resources :orders
      resources :orderitems
      

    end
  
  end
end