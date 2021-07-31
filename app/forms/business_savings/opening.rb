# frozen_string_literal: true

module BusinessSavings
  class Opening
    include ActiveModel::Model

    attr_accessor :institution_id, :institution_type, :business_type, :business_id, :account_number

    def process!
      if valid?
        ApplicationRecord.transaction do
          create_business_saving
        end
      end
    end

    def find_business_saving
      Savings::AccountTypes::BusinessSaving.find_by!(account_number: account_number)
    end

    def create_business_saving
      Savings::AccountTypes::BusinessSaving.create!(
        account_number: account_number,
        business: find_business,
        institution: find_institution,
        depository_account: create_depository_account
      )
    end

    def find_business
      business_type.constantize.find(business_id)
    end

    def find_institution
      institution_type.constantize.find(institution_id)
    end

    def create_depository_account
      Accounting::Accounts::Liability.create!(
        name: "Business Savings #{find_business.name}-#{account_number}",
        code: account_number,
        institution: find_institution
      )
    end
  end
end

