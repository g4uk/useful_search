module UsefulSearch
  module Argument
    module Matchers
      class Negative < ::UsefulSearch::Argument::Matcher
        # Example `Lisp Common` or reverse
        def argument_suitable_template
          /^(?<positive>#{get_precision_template})\s+--(?<negative>#{get_precision_template})$/i
        end

        # Search matcher
        #
        # negative searches, e.g. john --array, which should match
        # "BASIC", "Haskell", "Lisp" and "S--Lang", but not "Chapel", "Fortran"
        # or "S".
        def match(data)
          positive = @argument_match_data[:positive].to_s.downcase
          negative = @argument_match_data[:negative].to_s.downcase

          data.select do |x|
            joined_values = x.values.join(' ').downcase
            joined_values.include?(positive) && !joined_values.include?(negative)
          end
        end
      end
    end
  end
end