# HighriseCRM::Client

This gem is designed to communicate with the *Highrise Deals API*
through instantiation of the main class **HighriseCRM::Client**.
To instantiate you need the API key from a Highrise Deals account.

This Gem supports the following **Highrise Deals API** methods:

* People
* Users
* Custom Fields
* Me


All methods in this gem use **XML** formatting to send the request, however Gyoku is used to transform the hash data to xml before the request is sent. To read on the Highrise API please visit (https://github.com/basecamp/highrise-api)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'HighriseCRM-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install HighriseCRM-client

## Usage

To begin:

```ruby
Highrise = HighriseCRM::Client.new(base_site, token)
```
To check if a successful connection can be made to the API:

```ruby
Highrise.ping
```
This will return *true* or *false*.

The get methods  do not support pagination but the endpoints each have a collection limit.

```ruby
response = Highrise.people
```
The response has a page limit of 500 according to the Highrise docs.
```ruby
response["people"]
```

To create a person on *Highrise Deals*:
```ruby
Highrise.create_person(person)
```
The person parameter has to be a hash representing the xml according to (https://github.com/basecamp/highrise-api/blob/master/sections/people.md).


## Contributing

1. Fork it ( https://github.com/vaberay/HighriseCRM-client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
