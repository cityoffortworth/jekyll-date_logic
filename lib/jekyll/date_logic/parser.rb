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
        validate_time
        time = time? ? parse_time : nil
        for_hours = for_hours? ? parse_for_hours : nil
        super if qualifies?(time, for_hours)
      end

      def time?
        !@context[@args[0]].nil?
      end

      def validate_time
        puts "'#{@tag_name}' block has missing or invalid #{@args[0]} time." unless time?
      end

      def parse_time
        begin
          time = Time.parse(@context[@args[0]].to_s)
        rescue
          puts "Unable to parse #{@args[0]} as time in '#{@tag_name}' block."
          raise
        end
      end

      def for_hours?
        !@args[1].nil?
      end

      def parse_for_hours
        begin
          if @args[1] =~ /for_hours=([0-9]*)/ then
            Integer($1)
          else
            raise "Unable to parse '#{@args[1]}' as 'for_hours=NUMBER' in #{@tag_name} block."
          end
        end
      end
    end
  end
end
