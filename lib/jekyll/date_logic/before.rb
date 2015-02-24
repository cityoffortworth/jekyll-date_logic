require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    class Before < Liquid::Block

      include Parsable

      def self.show_content?(time = nil, for_hours = nil)
        if time.nil?
          true
        elsif for_hours.nil?
          Clock.future?(time)
        else
          Clock.future?(time) && Clock.past?(time - Convert.seconds(for_hours))
        end
      end

    end
  end
end

Liquid::Template.register_tag('before', Jekyll::DateLogic::Before)
