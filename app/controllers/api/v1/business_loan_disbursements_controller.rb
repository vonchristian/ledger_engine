module API
  module V1
    class BusinessLoanDisbursementsController < APIController
      def create
        @disbursement = ::BusinessLoans::Disbursement.new(disbursement_params)
        if @disbursement.valid?
          @disbursement.process!
          render json: @disbursement.find_business_loan
        else
          render json: 'Invalid'
        end
      end

      private

      def disbursement_params
        params.require(:business_loans_disbursement)
              .permit(:amount, :account_number, :cash_account_id, :business_type, :business_id)
      end

    end
  end
end
