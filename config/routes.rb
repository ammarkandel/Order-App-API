Rails.application.routes.draw do

namespace :api do
  namespace :v1 do
    post '/signin', to: 'user_token#create'
    post '/signup', to: 'users#create'

    resources :users, only: [:show] do
      resources :orders, only: [:create, :index]
    end

    resources :orders, only: [:change_status] do
      patch :change_status, on: :member
    end
   end
  end
end
