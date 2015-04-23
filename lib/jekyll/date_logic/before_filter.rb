require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    module BeforeFilter

      include Before
      include FilterParser

      def before(input, date)
        future_dates = input.select do |item|
          time = parse_time(item, date)
          Before.qualifies?(time)
        end
      end

    end
  end
end

Liquid::Template.register_filter(Jekyll::DateLogic::BeforeFilter)
