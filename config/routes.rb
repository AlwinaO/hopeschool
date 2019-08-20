Rails.application.routes.draw do

  root 'sessions#welcome'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :semesters

  resources :classrooms

  resources :teachers do
    resources :students #, only: [:new, :create, :edit, :update, :destroy]
    resources :teacher_semesters, only: [:new, :create]
  end

  # resources :teachers do
  #
  # end

  resources :students, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
