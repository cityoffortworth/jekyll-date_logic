require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    module BeforeFilter

      def before(input, date)
        future_dates = input.select do |item|
          time = parse_time(item, date)
          time.nil? || Clock.future?(time)
        end
      end

      private

      def parse_time(item, date)
        begin
          time = Time.parse(item[date])
        rescue
          puts "Unable to parse #{date} as time in 'before' filter."
          nil
        end
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::DateLogic::BeforeFilter)
