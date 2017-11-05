Rails.application.routes.draw do

  devise_for :users
  root 'welcome#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  get '/mentors/new'
  get '/mentees/new'
  get "/pages/:page" => "pages#show"

  resources :sessions
  resources :messages
  resources :mentors do
    resources :mentor_surveys
    resources :areas
  end
  resources :mentees do
    resources :mentee_surveys
    resources :mentorships
  end

end
