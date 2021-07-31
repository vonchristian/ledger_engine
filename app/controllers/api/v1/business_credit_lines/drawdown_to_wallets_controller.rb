module API
  module V1
    module BusinessCreditLines
      class DrawdownToWalletsController < APIController
        def create
          @business_credit_line = CreditLines::AccountTypes::BusinessCreditLine.find(params.fetch(:business_credit_line_id))
          @disbursement = ::BusinessCreditLines::DrawdownToWallet.new(disbursement_params)
          if @disbursement.process!
            render json: @business_credit_line
          else
            render json: 'Invalid'
          end
        end

        private

        def disbursement_params
          params.require(:business_credit_lines_drawdown_to_wallet)
                .permit(:wallet_id, :amount)
                .merge!(business_credit_line_id: @business_credit_line.id)
        end
      end
    end
  end
end
