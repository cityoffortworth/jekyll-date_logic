require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    module AfterFilter

      def after(input, date)
        past_dates = input.select do |item|
          time = parse_time(item, date)
          time.nil? || Clock.past?(time)
        end
      end

      private

      def parse_time(item, date)
        begin
          time = Time.parse(item[date])
        rescue
          puts "Unable to parse #{date} as time in 'after' filter."
          nil
        end
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::DateLogic::AfterFilter)
