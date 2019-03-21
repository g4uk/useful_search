module UsefulSearch
  module Argument
    module Matchers
      class Simple < ::UsefulSearch::Argument::Matcher
        # Example `Lisp Common` or reverse
        def argument_suitable_template
          /^(#{get_precision_template})\s+(#{get_precision_template})$/i
        end

        # Search matcher
        #
        # search for `Lisp Common` should match a programming language
        # named "Common Lisp"
        def match(data)
          data_string = @argument_match_data.to_s.downcase
          data_string_reverse = data_string.split(' ').reverse.join(' ').downcase

          data.select do |x|
            joined_values = x.values.join(' ').downcase
            joined_values.include?(data_string) || joined_values.include?(data_string_reverse)
          end
        end
      end
    end
  end
end