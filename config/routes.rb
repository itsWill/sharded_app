Rails.application.routes.draw do
  resources :products
  resources :orders
  resources :shops
  resources :admin_reports
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
