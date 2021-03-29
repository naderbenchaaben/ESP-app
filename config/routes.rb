Rails.application.routes.draw do
  resources :images
  resources :categories
  resources :orders
  resources :products
  devise_for :users, controllers: { registrations: 'registrations' }
  namespace :api do
    namespace :v1 do
      get 'post/index'
      post :auth, to: 'authentication#create'
      get  '/auth' => 'authentication#fetch'
    end

  end
end