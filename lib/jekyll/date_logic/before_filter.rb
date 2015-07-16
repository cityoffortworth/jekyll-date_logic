require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    module BeforeFilter

      def before(input, date, for_hours = nil)
        return [] if input.nil?
        future_dates = input.select do |item|
          item = item_property(item, date)
          next true if item.nil?
          time = Time.parse(item.to_s)
          for_hours_number = ForHours.parse(for_hours) unless for_hours.nil?
          Before.qualifies?(time, for_hours_number)
        end
      end

      private

      # Copied from https://github.com/jekyll/jekyll/blob/92a9582733dfee0f359e491a8fae236e91087a54/lib/jekyll/filters.rb#L314-L322
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

Liquid::Template.register_filter(Jekyll::DateLogic::BeforeFilter)
