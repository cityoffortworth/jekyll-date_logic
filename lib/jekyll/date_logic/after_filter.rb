require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    module AfterFilter

      def after(input, date, for_hours = nil)
        return [] if input.nil?
        past_dates = input.select do |item|
          item = item_property(item, date)
          next true if item.nil?
          time = Time.parse(item.to_s)
          for_hours_number = ForHours.parse(for_hours) unless for_hours.nil?
          After.qualifies?(time, for_hours_number)
        end
      end

      private

      def item_property(item, property)
        if item.respond_to?(:to_liquid)
          item.to_liquid[property.to_s]
        elsif item.respond_to?(:data)
          item.data[property.to_s]
        else
          item[property.to_s]
        end
      end

    end
  end
end

Liquid::Template.register_filter(Jekyll::DateLogic::AfterFilter)
