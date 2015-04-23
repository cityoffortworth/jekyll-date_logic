require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    module AfterFilter

      def after(input, date, for_hours = nil)
        past_dates = input.select do |item|
          next true if item[date].nil?
          time = Time.parse(item[date])
          for_hours_number = ForHours.parse(for_hours) unless for_hours.nil?
          After.qualifies?(time, for_hours_number)
        end
      end

    end
  end
end

Liquid::Template.register_filter(Jekyll::DateLogic::AfterFilter)
