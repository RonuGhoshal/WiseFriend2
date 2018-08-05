Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :users, only: [:index, :show, :update]

  resources :messages
  resources :users do
    resources :mentor_surveys
    resources :mentee_surveys
    resources :areas
    resources :mentorships
  end
end
