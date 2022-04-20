Rails.application.routes.draw do
  devise_for :users
  resources :projects
  resources :reviews
  resources :teams
  resources :students
  resources :static_pages
  root 'static_pages#index'
  get '/:controller/:action', to: 'application'
  get '/team/add', to: 'teams#add'
  get '/team/remove', to: 'teams#remove'
  get '/project/add', to: 'projects#add'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
