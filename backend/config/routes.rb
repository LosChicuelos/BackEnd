# == Route Map
#
#                   Prefix Verb   URI Pattern                             Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)               devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)           devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)          devise/passwords#edit
#            user_password PATCH  /users/password(.:format)               devise/passwords#update
#                          PUT    /users/password(.:format)               devise/passwords#update
#                          POST   /users/password(.:format)               devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)                 devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)                devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                   devise/registrations#edit
#        user_registration PATCH  /users(.:format)                        devise/registrations#update
#                          PUT    /users(.:format)                        devise/registrations#update
#                          DELETE /users(.:format)                        devise/registrations#destroy
#                          POST   /users(.:format)                        devise/registrations#create
#               home_index GET    /home/index(.:format)                   home#index
#                   scores GET    /scores(.:format)                       scores#index
#                          POST   /scores(.:format)                       scores#create
#                    score GET    /scores/:id(.:format)                   scores#show
#                          PATCH  /scores/:id(.:format)                   scores#update
#                          PUT    /scores/:id(.:format)                   scores#update
#                          DELETE /scores/:id(.:format)                   scores#destroy
#                alliances GET    /alliances(.:format)                    alliances#index
#                          POST   /alliances(.:format)                    alliances#create
#                 alliance GET    /alliances/:id(.:format)                alliances#show
#                          PATCH  /alliances/:id(.:format)                alliances#update
#                          PUT    /alliances/:id(.:format)                alliances#update
#                          DELETE /alliances/:id(.:format)                alliances#destroy
#                 messages GET    /messages(.:format)                     messages#index
#                          POST   /messages(.:format)                     messages#create
#                  message GET    /messages/:id(.:format)                 messages#show
#                          PATCH  /messages/:id(.:format)                 messages#update
#                          PUT    /messages/:id(.:format)                 messages#update
#                          DELETE /messages/:id(.:format)                 messages#destroy
#                    sales GET    /sales(.:format)                        sales#index
#                          POST   /sales(.:format)                        sales#create
#                     sale GET    /sales/:id(.:format)                    sales#show
#                          PATCH  /sales/:id(.:format)                    sales#update
#                          PUT    /sales/:id(.:format)                    sales#update
#                          DELETE /sales/:id(.:format)                    sales#destroy
#                questions GET    /questions(.:format)                    questions#index
#                          POST   /questions(.:format)                    questions#create
#                 question GET    /questions/:id(.:format)                questions#show
#                          PATCH  /questions/:id(.:format)                questions#update
#                          PUT    /questions/:id(.:format)                questions#update
#                          DELETE /questions/:id(.:format)                questions#destroy
#                   photos GET    /photos(.:format)                       photos#index
#                          POST   /photos(.:format)                       photos#create
#                    photo GET    /photos/:id(.:format)                   photos#show
#                          PATCH  /photos/:id(.:format)                   photos#update
#                          PUT    /photos/:id(.:format)                   photos#update
#                          DELETE /photos/:id(.:format)                   photos#destroy
#                 articles GET    /articles(.:format)                     articles#index
#                          POST   /articles(.:format)                     articles#create
#                  article GET    /articles/:id(.:format)                 articles#show
#                          PATCH  /articles/:id(.:format)                 articles#update
#                          PUT    /articles/:id(.:format)                 articles#update
#                          DELETE /articles/:id(.:format)                 articles#destroy
#                    users GET    /users(.:format)                        users#index
#                          POST   /users(.:format)                        users#create
#                     user GET    /users/:id(.:format)                    users#show
#                          PATCH  /users/:id(.:format)                    users#update
#                          PUT    /users/:id(.:format)                    users#update
#                          DELETE /users/:id(.:format)                    users#destroy
#          classifications GET    /classifications(.:format)              classifications#index
#                          POST   /classifications(.:format)              classifications#create
#           classification GET    /classifications/:id(.:format)          classifications#show
#                          PATCH  /classifications/:id(.:format)          classifications#update
#                          PUT    /classifications/:id(.:format)          classifications#update
#               photos_new GET    /photos/new(.:format)                   photos#new
#              belongsuser GET    /belongsuser(.:format)                  articles#belongsuser
#         belongsuserpages GET    /belongsuserpages(.:format)             articles#belongsuserpages
#      messagesbelongsuser GET    /messagesbelongsuser(.:format)          messages#belongsuser
#     alliancesbelongsuser GET    /alliancesbelongsuser(.:format)         alliances#belongsuser
#         salesbelongsuser GET    /salesbelongsuser(.:format)             sales#belongsuser
#                   filter GET    /filter(.:format)                       articles#filter
#                          GET    /articles/user/:iduser(.:format)        pdfs#show {:format=>/pdf/}
#                          GET    /statistics/:iduser(.:format)           statistics#show {:format=>/pdf/}
#                          GET    /statistics/new/:idstatistics(.:format) statistics#show_all {:format=>/pdf/}
#                          GET    /confirmation/:iduser(.:format)         statistics#show_all {:format=>/pdf/}
#                    pages GET    /pages(.:format)                        articles#pages
#                 sessions GET    /sessions(.:format)                     sessions#index
#                          POST   /sessions(.:format)                     sessions#create
#                  session GET    /sessions/:id(.:format)                 sessions#show
#                          DELETE /sessions/:id(.:format)                 sessions#destroy

Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  resources :scores
  resources :alliances
  resources :messages
  resources :sales
  resources :questions
  resources :photos
  resources :articles
  resources :users
  resources :classifications, except: [:destroy]

  get "photos/new", to: "photos#new"

  get '/belongsuser', to: "articles#belongsuser"
  get '/belongsuserpages', to: "articles#belongsuserpages"
  get '/messagesbelongsuser', to: "messages#belongsuser"
  get '/alliancesbelongsuser', to: "alliances#belongsuser"
  get '/salesbelongsuser', to: "sales#belongsuser"
  get '/filter', to: "articles#filter"
  get "/articles/user/:iduser", to: "pdfs#show", format: 'pdf'
  get "/statistics/:iduser", to: "statistics#show", format: 'pdf'
  #Ruta general para renderizar estadisticas
  get "/statistics/new/:idstatistics", to: "statistics#show_all", format: 'pdf'
  get "/confirmation/:iduser", to: "statistics#show_all", format: 'pdf'
  get "/pages", to: "articles#pages"
  

  resources :sessions, only: [:create, :destroy, :show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
