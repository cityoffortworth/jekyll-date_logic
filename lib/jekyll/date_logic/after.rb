require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    class After < Liquid::Block

      def initialize(tag_name, args, tokens)
        super
        @args = args.split
      end

      def render(context)
        parser = Jekyll::DateLogic::Parser.new('after', context, @args)
        time = parser.time? ? parser.time : nil
        for_hours = parser.for_hours? ? parser.for_hours : nil
        super if show_content?(time, for_hours)
      end

      def self.show_content?(time = nil, for_hours = nil)
        time.nil? || time_qualifies(time, for_hours)
      end

      def self.time_qualifies(time, for_hours = nil)
        if for_hours.nil?
          Clock.past?(time)
        else
          Clock.past?(time) && Clock.future?(time + seconds(for_hours))
        end
      end

      def self.seconds(for_hours)
        for_hours * 60 * 60
      end

    end
  end
end

Liquid::Template.register_tag('after', Jekyll::DateLogic::After)
