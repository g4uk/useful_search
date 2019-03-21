module UsefulSearch
  module Argument
    module Matchers
      class Exact < ::UsefulSearch::Argument::Matcher
        # Example `Interpreted "Thomas Eugene"`
        def argument_suitable_template
          /^(#{get_precision_template})\s+"(.*)"$/i
        end

        # Search matcher
        #
        # exact matches, e.g. `Interpreted "Thomas Eugene"`,
        # which should match "BASIC", but not "Haskell"
        def match(data)
          data_captures = @argument_match_data.captures.map(&:downcase)
          data.select do |x|
            joined_values = x.values.join(' ').downcase
            data_captured = data_captures.map { |data_capture| joined_values.include?(data_capture) }
            data_captured.reject{|x_data| !x_data }.length == data_captures.length
          end
        end
      end
    end
  end
end