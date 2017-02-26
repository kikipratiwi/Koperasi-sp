Rails.application.routes.draw do
  root "pages#home"
  get 'pages/home'

  devise_for :officials, controllers: {
    sessions: 'officials/sessions',
    registrations: 'officials/registrations'
  }

  resources :loan_types
  resources :interests
  resources :savings

  resources :members do
    member do
      get :pay_principal_savings
    end
    resources :deposits
    resources :loans do
      collection do
        get :calculate_payment  
      end
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
