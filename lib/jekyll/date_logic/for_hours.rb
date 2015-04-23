require 'jekyll/date_logic'

module Jekyll
  module DateLogic
    module ForHours

      def self.parse(value)
        begin
          if value =~ /for_hours=([0-9]*)/ then
            Integer($1)
          else
            raise "Unable to parse '#{value}' as 'for_hours=NUMBER' in block."
          end
        end
      end

    end
  end
end
