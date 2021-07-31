module API
  module V1
    module BusinessSavings
      class BalanceController < APIController
        def index
          @business_saving = Savings::AccountTypes::BusinessSaving.find(params[:business_saving_id])

          render json: {
            as_of_date: Date.current.strftime('%D'),
            id: @business_saving.id,
            account_number: @business_saving.account_number,
            balance: BigDecimal(@business_saving.balance)
          }
        end
      end
    end
  end
end
