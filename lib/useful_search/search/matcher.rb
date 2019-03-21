module UsefulSearch
  module Search
    class Matcher
      def initialize(data, argument_matchers)
        @data = data
        @argument_matchers = argument_matchers
      end

      # Match arguments over chain of responsibility
      def match
        @argument_matchers[0...-1].each_with_index do |argument_matcher, index|
          @argument_matchers[index + 1].successor = argument_matcher
        end

        chain_matcher = @argument_matchers.last
        chain_matcher.check_to_assing_and_match(@data)
      end
    end
  end
end