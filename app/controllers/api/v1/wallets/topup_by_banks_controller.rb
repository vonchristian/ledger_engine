module API
  module V1
    module Wallets
      class TopupByBanksController < APIController
        def create
          @wallet = Wallet.find(params[:wallet_id])
          @topup_by_bank = ::Wallets::TopupByBank.new(topup_params)
          if @topup_by_bank.valid?
            @topup_by_bank.process!
            render json: @wallet
          else
            render json: 'Invalid'
          end
        end

        private

        def topup_params
          params.require(:wallets_topup_by_bank)
                .permit(:bank_account_id, :amount, :reference_number)
                .merge!(wallet_id: @wallet.id)
        end
      end
    end
  end
end
