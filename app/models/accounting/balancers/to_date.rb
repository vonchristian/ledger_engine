module Accounting
  module Balancers
    class ToDate
      attr_reader :from_date, :to_date,  :amounts

      def self.process(args={})
        obj = new(args)
        obj.run
      end

      def initialize(args={})
        @from_date = Date.current - Date.current.year.years
        @to_date   = args.fetch(:to_date)
        @amounts   = args.fetch(:amounts)
        @amounts   = amounts
      end

      def run
        compute
      end

      def compute
        date_range = DateRange.new(from_date: from_date, to_date: to_date)
        amounts.includes(:entry).
        where('entries.created_at' => date_range.range).
        total
      end
    end
  end
end
