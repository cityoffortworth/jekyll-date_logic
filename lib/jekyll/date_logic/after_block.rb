require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    class AfterBlock < Liquid::Block

      def initialize(tag_name, args, tokens)
        super
        @args = args.split
      end

      def render(context)
        time = !context[@args[0]].nil? ? Time.parse(context[@args[0]].to_s) : nil
        for_hours = !@args[1].nil? ? Parser.parse_for_hours(@args[1]) : nil
        super if After.qualifies?(time, for_hours)
      end

    end
  end
end

Liquid::Template.register_tag('after', Jekyll::DateLogic::AfterBlock)
