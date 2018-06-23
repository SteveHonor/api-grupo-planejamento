Rails.application.routes.draw do
  resources :solars
  resources :house_images
  resources :houses
  namespace :mail do
    resources :newsletters
  end
  namespace :mail do
    resources :contacts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
