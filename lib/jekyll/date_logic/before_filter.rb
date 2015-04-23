require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    module BeforeFilter

      def before(input, date, for_hours = nil)
        future_dates = input.select do |item|
          next true if item[date].nil?
          time = Time.parse(item[date])
          for_hours_number = Parser.parse_for_hours(for_hours) unless for_hours.nil?
          Before.qualifies?(time, for_hours_number)
        end
      end

    end
  end
end

Liquid::Template.register_filter(Jekyll::DateLogic::BeforeFilter)
