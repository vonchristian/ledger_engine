module API
  module V1
    module Wallets
      class FundTransferToBusinessSavingsController < APIController
        def create
          @wallet = Wallet.find(params.fetch(:wallet_id))
          @fund_transfer = ::Wallets::FundTransferToBusinessSaving.new(fund_transfer_params)
          if @fund_transfer.valid?
            @fund_transfer.process!
            render json: @wallet
          else
            render json: 'Invalid'
          end
        end

        private

        def fund_transfer_params
          params.require(:wallets_fund_transfer_to_business_saving)
                .permit(:business_saving_id, :amount)
                .merge!(source_wallet_id: @wallet.id)
        end
      end
    end
  end
end
