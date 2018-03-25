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
  get 'clasificaciones/new'

  get 'clasificaciones/create'

  get 'clasificaciones/update'

  get 'clasificaciones/edit'

  get 'clasificaciones/destroy'

  get 'clasificaciones/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
