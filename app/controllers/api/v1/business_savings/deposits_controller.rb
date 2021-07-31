module API
  module V1
    module BusinessSavings
      class DepositsController < APIController
        def create
          @business_saving = Savings::AccountTypes::BusinessSaving.find(params[:business_saving_id])
          @deposit = ::BusinessSavings::Deposit.new(deposit_params)
          if @deposit.valid?
            @deposit.process!
            render json: @business_saving
          else
            render json: 'Invalid'
          end
        end

        private

        def deposit_params
          params.require(:business_savings_deposit)
                .permit(:cash_account_id, :amount, :reference_number, :description)
                .merge!(business_saving_id: @business_saving.id)
        end
      end
    end
  end
end
