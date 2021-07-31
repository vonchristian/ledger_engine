module API
  module V1
    class BusinessSavingOpeningsController < APIController
      def create
        @opening = ::BusinessSavings::Opening.new(opening_params)
        if @opening.valid?
          @opening.process!
          render json: @opening.find_business_saving
        else
          render json: 'Invalid'
        end
      end

      private

      def opening_params
        params.require(:business_saving_openings)
              .permit(:institution_type, :institution_id, :business_type, :business_id, :account_number)
      end
    end
  end
end
