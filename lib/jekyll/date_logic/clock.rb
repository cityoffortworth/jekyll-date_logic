require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    module Clock

      def now
        Time.now
      end

      def past?(date_time)
        now > date_time
      end

      def future?(date_time)
        now < date_time
      end

    end
  end
end
