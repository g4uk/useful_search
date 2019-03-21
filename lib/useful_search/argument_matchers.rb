module UsefulSearch
  class ArgumentMatchers
    def initialize(arguments)
      @arguments = arguments
    end

    # Fet available argument matchers
    def matchers
      Argument::Matcher.subclasses.map { |subclass| subclass.new(@arguments) }
    end
  end
end