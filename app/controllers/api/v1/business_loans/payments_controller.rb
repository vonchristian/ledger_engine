module API
  module V1
    module BusinessLoans
      class PaymentsController < APIController
        def create
          @business_loan = Loans::LoanTypes::BusinessLoan.find(params[:business_loan_id])
          @payment = ::BusinessLoans::Payment.new(payment_params)
          if @payment.process!
            render json: @business_loan
          else
            render json: 'Invalid'
          end
        end

        private

        def payment_params
          params.require(:business_loans_payment)
                .permit(:cash_account_id, :amount, :reference_number, :description)
                .merge!(business_loan_id: @business_loan.id)
        end
      end
    end
  end
end
