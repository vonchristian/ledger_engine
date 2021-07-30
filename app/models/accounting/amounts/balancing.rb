module Accounting
  module Amounts
    module Balancing

      def total
        Money.new(sum(:amount_cents)).amount
      end

      def balance(args={})
        balancer(args).process(args.merge(amounts: self))
      end

      private

      def balancer(args={})
        if args.present?
          balancer = args.compact.keys.sort.map{ |key| key.to_s.titleize }.join.gsub(" ", "")
        else
          balancer = "DefaultBalancer"
        end

        ("Accounting::Balancers::#{balancer}").constantize
      end
    end
  end
end
