module Accounting
  module Balancers
    class FromDateFromTimeToDateToTime
      attr_reader :from_date, :to_date, :from_time, :to_time

      def initialize(args={})
        @from_date = args.fetch(:from_date)
        @to_date   = args.fetch(:to_date)
        @from_time = args.fetch(:from_time)
        @to_time   = args.fetch(:to_time)

      end

      def compute
        date_range = DateRange.new(from_date: from_date, to_date: to_date)
        time_range = TimeRange.new(from_time: from_time, to_time: to_time)

        amounts.includes(:entry).
        where('entries.created_at' => date_range.range).
        where('entries.entry_time' => time_range.range).
        total
      end
    end
  end
end
