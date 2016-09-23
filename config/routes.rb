Rails.application.routes.draw do
  devise_for :users, skip: [:sessions],
    controllers: { registrations: 'users/registrations' }

  as :user do
    get 'login' => 'devise/sessions#new', as: :new_user_session
    post 'login' => 'devise/sessions#create', as: :user_session
    delete 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :teams do
    resources :members
  end

  get 'invitations/:id' => 'invitations#accept', as: :accept_invitation

  root to: 'teams#index'
end
