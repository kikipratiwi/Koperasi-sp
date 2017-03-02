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
  resources :deposit_categories

  resources :members do
    get 'reports/member_card', as: 'card' 
    member do
      get :pay_principal_savings
    end
    resources :deposits
    resources :loans do
      collection do
        get :calculate_payment  
      end
      member do
        get :approvment
        post :payment
      end
    end
  end

  get 'reports/member', as: 'member_report' 
  get 'reports/deposit', as: 'deposit_report' 

end
