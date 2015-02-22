require 'jekyll'

module Jekyll
  module DateBlock
    class Before < Liquid::Block

      def initialize(tag_name, args, tokens)
        super
        @args = args.split
      end

      def render(context)
        if DateBlock.no_date?(context, @args, 'before')
          super
        else
          time = DateBlock.parse_date_time(context, @args[0], 'before')
          super if Time.now < time
        end
      end

    end

    class After < Liquid::Block

      def initialize(tag_name, args, tokens)
        super
        @args = args.split
      end

      def render(context)
        if DateBlock.no_date?(context, @args, 'after')
          super
        else
          now = Time.now
          time = DateBlock.parse_date_time(context, @args[0], 'after')

          if DateBlock.no_duration?(context, @args)
            super if now > time
          else
            hours = DateBlock.parse_hours(context, @args)
            seconds = hours * 60 * 60
            super if (now > time) && ((time + seconds) > now)
          end
        end
      end

    end

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

Liquid::Template.register_tag('before', Jekyll::DateBlock::Before)
Liquid::Template.register_tag('after', Jekyll::DateBlock::After)
