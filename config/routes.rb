Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post 'user_token' => 'user_token#create'

      resources :products, only: [:import] do
        collection do
          post :import
        end
      end

      resources :orders, only: [:create, :index] do
        member do
          patch :change_status
        end
      end
    end
  end
end
