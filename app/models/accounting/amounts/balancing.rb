# frozen_string_literal: true

module Accounting
  module Amounts
    module Balancing
      def total
        Money.new(sum(:amount_cents)).amount
      end

      def balance(args = {})
        balancer(args).process(args.merge(amounts: self))
      end

      def balance_for_new_record
        balance = BigDecimal('0')
        all.each do |amount_record|
          if amount_record.amount && !amount_record.marked_for_destruction?
            balance += amount_record.amount # unless amount_record.marked_for_destruction?
          end
        end
        return balance
      end

      private

      def balancer(args = {})
        # rubocop:disable Style/ConditionalAssignment
        if args.present?
          balancer = args.compact.keys.sort.map { |key| key.to_s.titleize }.join.gsub(' ', '')
        else
          balancer = 'DefaultBalancer'
        end
        # rubocop:enable Style/ConditionalAssignment

        "Accounting::Balancers::#{balancer}".constantize
      end
    end
  end
end
