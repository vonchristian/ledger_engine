module Accounting
  module Balancers
    class DefaultBalancer
      attr_reader :amounts

      def self.process(args = {})
        obj = new(args)
        obj.run
      end

      def initialize(args = {})
        @amounts = args.fetch(:amounts)
      end

      def run
        compute
      end

      def compute
        amounts.total
      end
    end
  end
end
