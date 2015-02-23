require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    class Before < Liquid::Block

      include Jekyll::DateLogic::Clock

      def initialize(tag_name, args, tokens)
        super
        @args = args.split
      end

      def render(context)
        @parser = Jekyll::DateLogic::Parser.new(content, @args, 'before')
        super if time_missing || time_qualifies
      end

      def time_qualifies
        time = @parser.time
        future?(time)
      end

      def time_missing
        !@parser.time?
      end

    end
  end
end

Liquid::Template.register_tag('before', Jekyll::DateLogic::Before)
