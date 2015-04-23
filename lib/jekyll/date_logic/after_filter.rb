require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    module AfterFilter

      include FilterParser

      def after(input, date)
        past_dates = input.select do |item|
          time = parse_time(item, date)
          time.nil? || Clock.past?(time)
        end
      end

    end
  end
end

Liquid::Template.register_filter(Jekyll::DateLogic::AfterFilter)
