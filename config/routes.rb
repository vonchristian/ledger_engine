Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :business_loan_disbursements, only: [:create]
      resources :business_loans, only: [:show] do
        resources :payments, only: [:create], module: :business_loans
      end
      resources :business_saving_openings, only: [:create]
      resources :business_savings, only: [:show] do
        resources :deposits, only: [:create], module: :business_savings
        resources :withdrawals, only: [:create], module: :business_savings

      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
