require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    class Before < Liquid::Block

      def initialize(tag_name, args, tokens)
        super
        @args = args.split
      end

      def render(context)
        parser = Jekyll::DateLogic::Parser.new('before', context, @args)
        time = parser.time? ? parser.time : nil
        super if show_content?(time)
      end

      def self.show_content?(time = nil)
        time.nil? || Clock.future?(time)
      end

    end
  end
end

Liquid::Template.register_tag('before', Jekyll::DateLogic::Before)
