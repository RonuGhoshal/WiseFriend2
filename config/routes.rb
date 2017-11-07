Rails.application.routes.draw do

  devise_for :users

  root 'welcome#index'

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
