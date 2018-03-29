Rails.application.routes.draw do
  resources :scores
  resources :alliances
  resources :messages
  resources :sales
  resources :questions
  resources :photos
  resources :articles
  resources :users
  resources :classifications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
