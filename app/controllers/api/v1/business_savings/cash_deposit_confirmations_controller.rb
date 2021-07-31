module API
  module V1
    module BusinessSavings
      class CashDepositConfirmationsController < APIController
        def create
          @business_saving = Savings::AccountTypes::BusinessSaving.find(params[:business_saving_id])
          @deposit = ::BusinessSavings::CashDepositConfirmation.new(deposit_params)
          if @deposit.valid?
            @deposit.process!
            render json: @business_saving
          else
            render json: 'Invalid'
          end
        end

        private

        def deposit_params
          params.require(:business_savings_cash_deposit_confirmation)
                .permit(:deposit_voucher_id)
                .merge!(business_saving_id: @business_saving.id)
        end
      end
    end
  end
end
