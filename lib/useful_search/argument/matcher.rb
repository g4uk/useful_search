module UsefulSearch
  module Argument
    class Matcher
      class ArgumentMatcherError < StandardError; end

      attr_accessor :successor

      # search match precision types
      MATCH_PRECISSION_TEMPLATES = {
        words: '\w+'
      }

      #search match precision (full words matching)
      MATCH_PRECISSION = :words

      def initialize(arguments, successor = nil)
        @arguments = arguments
        @successor = successor
        @argument_match_data = nil
        @result = nil
      end

      # return search match precision
      def get_precision_template
        MATCH_PRECISSION_TEMPLATES[MATCH_PRECISSION]
      end

      # Check arguments and setup related search matcher
      # over chain of responsibility
      def check_to_assing_and_match(data)
        if check_suitable && (@result = match(data))
          return @result
        end

        if successor.present?
          return successor.check_to_assing_and_match(data)
        end
      end

      # Check argument is suitable for any matcher
      def check_suitable
        @argument_match_data = argument_suitable_template.match(@arguments.first)
      end

      # Search matcher interface
      def match(data)
        raise ArgumentMatcherError.new('Method `match(data)` should be implemented all subclasses')
      end

      # Argument regexp template interface
      def argument_suitable_template
        raise ArgumentMatcherError.new('Method `argument_suitable_template` should be implemented all subclasses')
      end
    end
  end
end