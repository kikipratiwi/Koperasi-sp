Rails.application.routes.draw do
  devise_for :officials, controllers: {
    sessions: 'officials/sessions',
    registrations: 'officials/registrations'
  }

  root "members#index"

  resources :interests
  resources :members do
  	resources :deposits
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
