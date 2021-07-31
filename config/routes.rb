Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :business_loans, only: [:show], defaults: { format: :json } do
        resources :payments, only: [:create], module: :business_loans
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
