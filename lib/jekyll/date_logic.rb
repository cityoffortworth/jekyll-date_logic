require 'jekyll'
require 'jekyll/date_logic/version'
require 'jekyll/date_logic/before'
require 'jekyll/date_logic/after'

module Jekyll
  module DateLogic

    def self.parse_date_time(context, value, block_name)
      begin
        time = Time.parse(context[value].to_s)
      rescue
        puts "Unable to parse #{value} as a date in '#{block_name}' block."
        raise
      end
    end

    def self.no_duration?(context, args)
      args[1].nil?
    end

    def self.parse_hours(context, args)
      begin
        if args[1] =~ /for_hours=([0-9]*)/ then
          Integer($1)
        else
          raise "Unable to parse '#{args[1]}' as 'for_hours=NUMBER' in after block."
        end
      end
    end

    def self.no_date?(context, args, block_name)
      no_date = context[args[0]].nil?
      puts "'#{block_name}' block has missing or invalid date." if no_date
      no_date
    end

  end
end
