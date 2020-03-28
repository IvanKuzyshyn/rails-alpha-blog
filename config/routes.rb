Rails.application.routes.draw do

  namespace :api do
    resources :users, only: [:index, :show, :create, :update, :destroy] do
      resources :articles, only: [:index, :show, :create, :update, :destroy]
      resources :comments, only: [:index, :show, :create, :update, :destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
