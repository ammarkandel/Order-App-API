Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post '/signin', to: 'user_token#create'
      post '/signup', to: 'users#create'

      resources :users, only: [:show] do
        resources :orders
      end

      resources :products, only: [:import] do
        collection do
          post :import
        end
      end

      resources :orders, only: [:create] do
        member do
          patch :change_status
        end
      end
    end
  end
end
