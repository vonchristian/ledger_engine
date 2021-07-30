module Accounting
  module Balancers
    class ToDateToTime
      attr_reader :from_date, :to_date, :from_time, :to_time, :amounts

      def self.process(args={})
        obj = new(args)
        obj.run
      end

      def initialize(args={})
        @from_date = Date.current - Date.current.year.years
        @to_date   = args.fetch(:to_date)
        @to_time   = args.fetch(:to_time)
        @amounts   = args.fetch(:amounts)
        @from_time = @to_date.beginning_of_day.to_datetime
        @amounts   = amounts
      end

      def run
        compute
      end

      def compute
        date_range = DateRange.new(from_date: from_date, to_date: to_date)
        time_range = TimeRange.new(from_time: from_time, to_time: to_time)
        amounts.includes(:entry).
        where('entries.created_at' => date_range.range).
        where('entries.created_at' => time_range.range).
        total
      end
    end
  end
end
