# == Route Map
#
#          Prefix Verb   URI Pattern                    Controller#Action
#      home_index GET    /home/index(.:format)          home#index
#          scores GET    /scores(.:format)              scores#index
#                 POST   /scores(.:format)              scores#create
#           score GET    /scores/:id(.:format)          scores#show
#                 PATCH  /scores/:id(.:format)          scores#update
#                 PUT    /scores/:id(.:format)          scores#update
#                 DELETE /scores/:id(.:format)          scores#destroy
#       alliances GET    /alliances(.:format)           alliances#index
#                 POST   /alliances(.:format)           alliances#create
#        alliance GET    /alliances/:id(.:format)       alliances#show
#                 PATCH  /alliances/:id(.:format)       alliances#update
#                 PUT    /alliances/:id(.:format)       alliances#update
#                 DELETE /alliances/:id(.:format)       alliances#destroy
#        messages GET    /messages(.:format)            messages#index
#                 POST   /messages(.:format)            messages#create
#         message GET    /messages/:id(.:format)        messages#show
#                 PATCH  /messages/:id(.:format)        messages#update
#                 PUT    /messages/:id(.:format)        messages#update
#                 DELETE /messages/:id(.:format)        messages#destroy
#           sales GET    /sales(.:format)               sales#index
#                 POST   /sales(.:format)               sales#create
#            sale GET    /sales/:id(.:format)           sales#show
#                 PATCH  /sales/:id(.:format)           sales#update
#                 PUT    /sales/:id(.:format)           sales#update
#                 DELETE /sales/:id(.:format)           sales#destroy
#       questions GET    /questions(.:format)           questions#index
#                 POST   /questions(.:format)           questions#create
#        question GET    /questions/:id(.:format)       questions#show
#                 PATCH  /questions/:id(.:format)       questions#update
#                 PUT    /questions/:id(.:format)       questions#update
#                 DELETE /questions/:id(.:format)       questions#destroy
#          photos GET    /photos(.:format)              photos#index
#                 POST   /photos(.:format)              photos#create
#           photo GET    /photos/:id(.:format)          photos#show
#                 PATCH  /photos/:id(.:format)          photos#update
#                 PUT    /photos/:id(.:format)          photos#update
#                 DELETE /photos/:id(.:format)          photos#destroy
#        articles GET    /articles(.:format)            articles#index
#                 POST   /articles(.:format)            articles#create
#         article GET    /articles/:id(.:format)        articles#show
#                 PATCH  /articles/:id(.:format)        articles#update
#                 PUT    /articles/:id(.:format)        articles#update
#                 DELETE /articles/:id(.:format)        articles#destroy
#           users GET    /users(.:format)               users#index
#                 POST   /users(.:format)               users#create
#            user GET    /users/:id(.:format)           users#show
#                 PATCH  /users/:id(.:format)           users#update
#                 PUT    /users/:id(.:format)           users#update
#                 DELETE /users/:id(.:format)           users#destroy
# classifications GET    /classifications(.:format)     classifications#index
#                 POST   /classifications(.:format)     classifications#create
#  classification GET    /classifications/:id(.:format) classifications#show
#                 PATCH  /classifications/:id(.:format) classifications#update
#                 PUT    /classifications/:id(.:format) classifications#update
#                 DELETE /classifications/:id(.:format) classifications#destroy
#     belongsuser GET    /belongsuser(.:format)         articles#belongsuser
#        sessions POST   /sessions(.:format)            sessions#create
#         session DELETE /sessions/:id(.:format)        sessions#destroy
# 

Rails.application.routes.draw do
  devise_for :authentications
  get 'home/index'

  resources :scores
  resources :alliances
  resources :messages
  resources :sales
  resources :questions
  resources :photos
  resources :articles
  resources :users
  resources :classifications
  get '/belongsuser', to: "articles#belongsuser"


  resource :sessions, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
