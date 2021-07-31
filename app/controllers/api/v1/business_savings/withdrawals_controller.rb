module API
  module V1
    module BusinessSavings
      class WithdrawalsController < APIController
        def create
          @business_saving = Savings::AccountTypes::BusinessSaving.find(params[:business_saving_id])
          @withdrawal = ::BusinessSavings::Withdrawal.new(withdrawal_params)
          if @withdrawal.valid?
            @withdrawal.process!
            render json: @business_saving
          else
            render json: 'Invalid'
          end
        end

        private

        def withdrawal_params
          params.require(:business_savings_withdrawal)
                .permit(:cash_account_id, :amount, :reference_number, :description)
                .merge!(business_saving_id: @business_saving.id)
        end
      end
    end
  end
end
