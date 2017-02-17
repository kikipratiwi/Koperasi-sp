Rails.application.routes.draw do
  devise_for :officials, controllers: {
    sessions: 'officials/sessions',
    registrations: 'officials/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
