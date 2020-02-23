Rails.application.routes.draw do
  resources :drafts
  get 'pages/welcome'
  get 'pages/about'
  get 'pages/help'
  get "/admin/config", to: "admin#setup"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
