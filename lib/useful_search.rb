require 'useful_search/version'
require 'useful_search/search/matcher'
require 'useful_search/search/file'
require 'useful_search/argument/matcher'
require 'useful_search/argument_matchers'
require 'useful_search/argument/matchers/exact'
require 'useful_search/argument/matchers/in_different_fields'
require 'useful_search/argument/matchers/simple'
require 'useful_search/argument/matchers/negative'

module UsefulSearch
  class CLI < Thor
    desc "get [file_path, *expressions]", "to demonstrate a search logic"
    def get(file_path, *args)
      begin
        argument_matchers = ArgumentMatchers.new(args).matchers
        data_to_match = Search::File.new(file_path, JSON).parse

        puts Search::Matcher.new(data_to_match, argument_matchers).match
      rescue StandardError => e
        $stderr.puts "Error: #{e}"
        exit 1
      end
    end
  end
end
