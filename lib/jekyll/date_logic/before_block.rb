require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    class BeforeBlock < Liquid::Block

      include Parser
      include Before

    end
  end
end

Liquid::Template.register_tag('before', Jekyll::DateLogic::BeforeBlock)
