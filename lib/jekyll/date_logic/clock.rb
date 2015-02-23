require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    module Clock

      def self.now
        Time.now
      end

      def self.past?(time)
        now > time
      end

      def self.future?(time)
        now < time
      end

    end
  end
end
