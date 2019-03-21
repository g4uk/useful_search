module UsefulSearch
  module Argument
    module Matchers
      class InDifferentFields < ::UsefulSearch::Argument::Matcher
        # Example
        def argument_suitable_template
          /^(#{get_precision_template})\s+(#{get_precision_template})$/i
        end

        # Search matcher
        #
        # match in different fields, e.g. `Scripting Microsoft` should return all
        # scripting languages designed by "Microsoft"
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