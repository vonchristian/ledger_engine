module API
  module V1
    module BusinessSavings
      class CashWithdrawalInitiationsController < APIController
        def create
          @reference_number = SecureRandom.hex
          @business_saving = Savings::AccountTypes::BusinessSaving.find(params[:business_saving_id])
          @cash_withdrawal = ::BusinessSavings::CashWithdrawalInitiation.new(cash_withdrawal_params)
          if @cash_withdrawal.valid?
            @cash_withdrawal.process!
            @voucher = Voucher.find_by(reference_number: @reference_number)
            render json: @voucher
          else
            render json: 'Invalid'
          end
        end

        def show
          @voucher = Voucher.find(params[:id])
          render json: @voucher
        end

        private

        def cash_withdrawal_params
          params.require(:business_savings_cash_withdrawal_initiation)
                .permit(:cash_account_id, :amount)
                .merge!(business_saving_id: @business_saving.id, reference_number: @reference_number)
        end
      end
    end
  end
end

