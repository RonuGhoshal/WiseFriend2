Rails.application.routes.draw do

  devise_for :users

  root 'welcome#index'

  resources :messages
  resources :users do
    resources :mentor_surveys
    resources :mentee_surveys
    resources :areas
    resources :mentorships
  end
end
