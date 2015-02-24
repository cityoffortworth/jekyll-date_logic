require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    class Before < Liquid::Block

      def initialize(tag_name, args, tokens)
        super
        @args = args.split
      end

      def render(context)
        parser = Parser.new('before', context, @args)
        time = parser.time? ? parser.time : nil
        for_hours = parser.for_hours? ? parser.for_hours : nil
        super if show_content?(time, for_hours)
      end

      def self.show_content?(time = nil, for_hours = nil)
        time.nil? || time_qualifies(time, for_hours)
      end

      def self.time_qualifies(time, for_hours = nil)
        if for_hours.nil?
          Clock.future?(time)
        else
          Clock.future?(time) && Clock.past?(time - Convert.seconds(for_hours))
        end
      end

    end
  end
end

Liquid::Template.register_tag('before', Jekyll::DateLogic::Before)
