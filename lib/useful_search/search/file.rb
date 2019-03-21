module UsefulSearch
  module Search
    class File
      def initialize(file_path, parser)
        @file = ::File.open(file_path, 'r')
        @parser = parser
      end

      # File parser
      def parse
        @parser.parse(@file.read)
      end
    end
  end
end