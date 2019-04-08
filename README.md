# Threadfix
Command line tool to upload a static analysis report to ThreadFix

## Installation

Install it  with:

```ruby
 $ gem install threadfix
```

## Usage

```ruby
 $ threadfix scan upload --app-id <APP-ID> --host <Server> --key <Auth Key> --file ./repo/results.json
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/threadfix-cli.
