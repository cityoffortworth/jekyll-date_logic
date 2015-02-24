require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    class After < Liquid::Block

      include Parsable

      def self.show_content?(time = nil, for_hours = nil)
        if time.nil?
          true
        elsif for_hours.nil?
          Clock.past?(time)
        else
          Clock.past?(time) && Clock.future?(time + Convert.seconds(for_hours))
        end
      end

    end
  end
end

Liquid::Template.register_tag('after', Jekyll::DateLogic::After)
