require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    module After

      def qualifies?(time = nil, for_hours = nil)
        if time.nil?
          true
        elsif for_hours.nil?
          Clock.past?(time)
        else
          Clock.past?(time) && Clock.future?(time + Convert.seconds(for_hours))
        end
      end

    end
  end
end
