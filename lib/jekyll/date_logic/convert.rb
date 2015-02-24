require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    module Convert

      def self.seconds(for_hours)
        for_hours * 60 * 60
      end

    end
  end
end
