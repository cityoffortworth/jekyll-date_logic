require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    class After < Liquid::Block

      include Jekyll::DateLogic::Clock

      def initialize(tag_name, args, tokens)
        super
        @args = args.split
      end

      def render(context)
        @parser = Jekyll::DateLogic::Parser.new(content, @args, 'after')
        super if time_missing || time_qualifies
      end

      def time_qualifies
        time = @parser.time
        if for_hours_missing
          past?(time)
        else
          hours = @parser.for_hours
          seconds = hours * 60 * 60
          past?(time) && future?(time + seconds)
        end
      end

      def time_missing
        !@parser.time?
      end

      def for_hours_missing
        !@parser.for_hours?
      end

    end
  end
end

Liquid::Template.register_tag('after', Jekyll::DateLogic::After)
