# UsefulSearch

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/useful_search`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'useful_search'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install useful_search

## Usage

- search for `Lisp Common` should match a programming language
  named "Common Lisp"
  
        $   bundle exec exe/useful_search get './data/data.json' 'Lisp Common'
        

- support for exact matches, e.g. `Interpreted "Thomas Eugene"`,
  which should match "BASIC", but not "Haskell"
  
        $ bundle exec exe/useful_search get './data/data.json' 'Interpreted "Thomas Eugene"'

- match in different fields, e.g. `Scripting Microsoft` should return all
  scripting languages designed by "Microsoft"
  
        $  bundle exec exe/useful_search get './data/data.json' 'Scripting Microsoft'

- support for negative searches, e.g. john --array, which should match
"BASIC", "Haskell", "Lisp" and "S--Lang", but not "Chapel", "Fortran"
or "S".

        $ bundle exec exe/useful_search get './data/data.json' 'john --array' 

You can add this gem to your project and use as lib.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/useful_search. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the UsefulSearch project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/useful_search/blob/master/CODE_OF_CONDUCT.md).
