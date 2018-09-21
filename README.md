# Niconico::Mylist

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/niconico/mylist`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'niconico-mylist'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install niconico-mylist

## Usage

``` ruby
require 'niconico/mylist'

mylist = Niconico::Mylist.find(42564899)
# => #<Niconico::Mylist title: 音MAD creator: 名有りさん>
mylist.title
# => "音MAD"
mylist.items
# => [#<Niconico::Mylist::Item title: 関東Trapper>,
 #<Niconico::Mylist::Item title: Fricken Dope☆.mp4>,
 #<Niconico::Mylist::Item title: ラジオ体操の歌神社.mp4>,
 #<Niconico::Mylist::Item title: THE SAFARI(BEAST).mp3>]
mylist.items[0]
# => #<Niconico::Mylist::Item title: 関東Trapper>
mylist.items[0].link
# => "http://www.nicovideo.jp/watch/sm31834553"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/niconico-mylist.
