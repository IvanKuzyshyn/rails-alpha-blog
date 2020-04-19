Rails.application.routes.draw do

  post 'auth/sign_in'
  get 'auth/sign_out'
  post 'auth/sign_up'
  namespace :api do
    resources :users, only: [:index, :show, :create, :update, :destroy] do
      resources :articles
      resources :comments
    end
    resources :categories, except: [:destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
