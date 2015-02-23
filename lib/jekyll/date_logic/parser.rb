require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    class Parser

      def initialize(block_name, context, args)
        @block_name = block_name
        @context = context
        @args = args
      end

      def time?
        missing = @context[@args[0]].nil?
        puts "'#{@block_name}' block has missing or invalid date." if missing
        missing
      end

      def time
        parse_time
      end

      def for_hours?
        @args[1].nil?
      end

      def for_hours
        parse_for_hours
      end

      private

      def parse_time
        begin
          time = Time.parse(@context[@args[0]].to_s)
        rescue
          puts "Unable to parse #{value} as a date in '#{@block_name}' block."
          raise
        end
      end

      def parse_for_hours
        begin
          if @args[1] =~ /for_hours=([0-9]*)/ then
            Integer($1)
          else
            raise "Unable to parse '#{@args[1]}' as 'for_hours=NUMBER' in #{@block_name} block."
          end
        end
      end

    end
  end
end
