Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :business_loan_disbursements, only: [:create]
      resources :business_loans, only: [:show] do
        resources :payments, only: [:create], module: :business_loans
      end
      resources :business_saving_openings, only: [:create]
      resources :business_savings, only: [:show] do
        resources :balance, only: [:index], module: :business_savings
        resources :deposits, only: [:create], module: :business_savings
        resources :withdrawals, only: [:create], module: :business_savings
      end

      resources :wallets, only: [:show] do
        resources :topup_by_banks, only: [:create], module: :wallets
        resources :fund_transfer_to_wallets, only: [:create], module: :wallets
        resources :fund_transfer_to_business_savings, only: [:create], module: :wallets
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
