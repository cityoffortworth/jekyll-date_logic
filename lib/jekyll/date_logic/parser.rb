require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    module Parser

      def initialize(tag_name, args, tokens)
        super
        @tag_name = tag_name
        @args = args.split
      end

      def render(context)
        @context = context
        time = !@context[@args[0]].nil? ? Time.parse(@context[@args[0]].to_s) : nil
        for_hours = !@args[1].nil? ? Parser.parse_for_hours(@args[1]) : nil
        super if qualifies?(time, for_hours)
      end

      def self.parse_for_hours(value)
        begin
          if value =~ /for_hours=([0-9]*)/ then
            Integer($1)
          else
            raise "Unable to parse '#{value}' as 'for_hours=NUMBER' in block."
          end
        end
      end
    end
  end
end
