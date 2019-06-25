Rails.application.routes.draw do

  root 'sessions#welcome'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  resources :semesters
  resources :classrooms
  resources :students
  resources :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
