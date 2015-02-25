require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    class AfterBlock < Liquid::Block

      include Parser
      include After

    end
  end
end

Liquid::Template.register_tag('after', Jekyll::DateLogic::AfterBlock)
