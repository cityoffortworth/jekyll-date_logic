module Jekyll
  module DateLogic
    class After < Liquid::Block

      def initialize(tag_name, args, tokens)
        super
        @args = args.split
      end

      def render(context)
        if DateLogic.no_date?(context, @args, 'after')
          super
        else
          now = Time.now
          time = DateLogic.parse_date_time(context, @args[0], 'after')

          if DateLogic.no_duration?(context, @args)
            super if now > time
          else
            hours = DateLogic.parse_hours(context, @args)
            seconds = hours * 60 * 60
            super if (now > time) && ((time + seconds) > now)
          end
        end
      end

    end
  end
end

Liquid::Template.register_tag('after', Jekyll::DateLogic::After)
