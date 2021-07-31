module API
  module V1
    module BusinessSavings
      class CashWithdrawalConfirmationsController < APIController
        def create
          @business_saving = Savings::AccountTypes::BusinessSaving.find(params[:business_saving_id])
          @withdrawal = ::BusinessSavings::CashWithdrawalConfirmation.new(withdrawal_params)
          if @withdrawal.valid?
            @withdrawal.process!
            render json: @business_saving
          else
            render json: 'Invalid'
          end
        end

        private

        def withdrawal_params
          params.require(:business_savings_cash_withdrawal_confirmation)
                .permit(:cash_withdrawal_voucher_id)
                .merge!(business_saving_id: @business_saving.id)
        end
      end
    end
  end
end
