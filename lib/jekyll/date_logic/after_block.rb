require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    class AfterBlock < Liquid::Block

      include Parser

      def qualifies?(time = nil, for_hours = nil)
        After.qualifies?(time, for_hours)
      end

    end
  end
end

Liquid::Template.register_tag('after', Jekyll::DateLogic::AfterBlock)
