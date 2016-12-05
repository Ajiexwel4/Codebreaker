# Codebreaker

Codebreaker is a logic game in which a code-breaker tries to break a secret code created by a code-maker. The code-maker, which will be played by the application we’re going to write, creates a secret code of four numbers between 1 and 6.


The code-breaker then gets some number of chances to break the code. In each turn, the code-breaker makes a guess of four numbers. The code-maker then marks the guess with up to four + and - signs.


A + indicates an exact match: one of the numbers in the guess is the same as one of the numbers in the secret code and in the same position.


A - indicates a number match: one of the numbers in the guess is the same as one of the numbers in the secret code but in a different position.

## Installation

Add this line to your application's Gemfile:

gem 'codebreaker'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install codebreaker

## Usage

	$ ruby lib/codebreaker.rb 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Ajiexwel4/codebreaker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

