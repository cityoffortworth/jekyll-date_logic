module Jekyll
  module DateLogic
    class Before < Liquid::Block

      def initialize(tag_name, args, tokens)
        super
        @args = args.split
      end

      def render(context)
        if DateLogic.no_date?(context, @args, 'before')
          super
        else
          time = DateLogic.parse_date_time(context, @args[0], 'before')
          super if Time.now < time
        end
      end

    end
  end
end

Liquid::Template.register_tag('before', Jekyll::DateLogic::Before)
