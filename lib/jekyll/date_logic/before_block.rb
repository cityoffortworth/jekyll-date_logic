require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    class BeforeBlock < Liquid::Block

      include Parser

      def qualifies?(time = nil, for_hours = nil)
        Before.qualifies?(time, for_hours)
      end

    end
  end
end

Liquid::Template.register_tag('before', Jekyll::DateLogic::BeforeBlock)
