# PlayStationNetwork::API

Retrieve User, Trophies and Game data from PlayStationNetwork.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'playstationnetwork-api', '~> 2.1'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install playstationnetwork-api

## Usage

#### Get a User
`PlayStationNetwork::User.new('pacMakaveli90').profile`

#### Get all Games for a User
`PlayStationNetwork::User.new('pacMakaveli90').games`


#### Get all Trophies for a Game
`PlayStationNetwork::User.new('pacMakaveli90').trophies('NPWR00132_00')`


#### Get a Game
`PlayStationNetwork::Game.new('NPWR00132_00').details`


#### Get all Trophies for a Game
`PlayStationNetwork::Game.new('NPWR00132_00').trophies`


#### Get all Games
`PlayStationNetwork::Game.new().all(platform: 'ps4') # you don't have to pass an argument. It will get all games by default.`

#### Get Popular Games
`PlayStationNetwork::Game.new().all(popular: true)`

## NEW

```
The new PlayStationNetwork::Store.new() endpoint takes two additional arguments, 'region' and 'language'. Defaults to GB/en.
More debugging is required, but so far the available regions are: ['GB/en', 'US/en']

ex: PlayStationNetwork::Store.new('Rocket League', region: 'US', language: 'en')
```

#### Search PlayStation Store for a game(s)
```
PlayStationNetwork::Store.new('Rocket League').search()

Optionally, you can pass a `game_type` argument which can be either 'Full Game' ( default ) or 'Bundle' . This will reduce the amount of data returned by the query.
```

#### Get PlayStation Store details for a given game
```
Important!: You must use this endpoint only when you have a store_id, usually returned by the search() endpoint.

PlayStationNetwork::Store.new('EP2002-CUSA01433_00-ROCKETLEAGUEEU01').details()
```

## Configuration

In your app, create a new initializer `playstationnetwork.rb` and add the following:

```
PlayStationNetwork::API.configure do |config|
  config.key = '<API_KEY>',
  config.secret = '<API_SECRET>'
  config.url = '<API_URL>'
  config.verify_ssl = boolean ( default is true )
})

# visit: http://www.psnleaderboard.com/ to get your key, secret and endpoint details
```

`verify_ssl` was introduced in v2.1.0 in order to fix an error returned by the API when communicating through SSL.
If you get the following error when trying to access the API, set `verify_ssl` to `false`
```
{ 
  success: false, 
  code: 500, 
  message: #<OpenSSL::SSL::SSLError: hostname '<API_URL>' does not match the server certificate>
}
```

Please note this option may be removed in a future release when a proper fix will be implemented.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and add any changes to the `changelog`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/games-directory/api-playstationnetwork/. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The MIT License (MIT)

Copyright (c) 2018 Vlad Radulescu, Studio51 Solutions, Studio51 Gaming Solutions

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
