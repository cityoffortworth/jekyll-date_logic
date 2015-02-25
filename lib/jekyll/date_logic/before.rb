require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    module Before

      def show_content?(time = nil, for_hours = nil)
        if time.nil?
          true
        elsif for_hours.nil?
          Clock.future?(time)
        else
          Clock.future?(time) && Clock.past?(time - Convert.seconds(for_hours))
        end
      end

    end
  end
end
