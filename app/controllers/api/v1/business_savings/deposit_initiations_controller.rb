module API
  module V1
    module BusinessSavings
      class DepositInitiationsController < APIController
        def create
          @reference_number = SecureRandom.hex
          @business_saving = Savings::AccountTypes::BusinessSaving.find(params[:business_saving_id])
          @deposit = ::BusinessSavings::DepositInitiation.new(deposit_params)
          if @deposit.valid?
            @deposit.process!
            @voucher = Voucher.find_by(reference_number: @reference_number)
            render json: @voucher
          else
            render json: 'Invalid'
          end
        end

        def show
          @deposit_voucher = Voucher.find(params[:id])
          render json: @deposit_voucher
        end

        private

        def deposit_params
          params.require(:business_savings_deposit_initiation)
                .permit(:cash_account_id, :amount)
                .merge!(business_saving_id: @business_saving.id, reference_number: @reference_number)
        end
      end
    end
  end
end
