Rails.application.routes.draw do
  root "real_estates#index"
  resources :real_estates
end
