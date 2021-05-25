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
      resources :products
      resources :companies, param: :user_id
      get '/user/:city', to: 'users#show_costomer'
      #get "/company/:user_id", to: "companies#showcomp" , as: 'companyy'
      resources :ratings

    end
  
  end
end