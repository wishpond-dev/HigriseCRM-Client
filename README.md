# HighriseCRM::Client

This gem is designed to communicate with the *Highrise CRM API*
through instantiation of the main class **HighriseCRM::Client**.
To instantiate you need the base site and the api token from a Highrise account.

This Gem supports the following **Highrise CRM API** methods:

* People
* Users
* Custom Fields
* Me


All methods in this gem use **XML** formatting to send the request, however Gyoku "(https://github.com/savonrb/gyoku)" is used to transform the hash data to xml before the request is sent. To read on the Highrise API please visit (https://github.com/basecamp/highrise-api)

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
client = HighriseCRM::Client.new(base_site, token)
```
To check if a successful connection can be made to the API:

```ruby
client.ping
```
This will return *true* or *false*.

The get methods  do not support pagination but the each endpoint has a collection size limit.

```ruby
response = client.people
```
The response has a page limit of 500 people per the Highrise docs.
```ruby
response["people"]
```

To create a person on *Highrise*:
```ruby
client.create_person(person)
```
The person parameter is a hash representing the xml in (https://github.com/basecamp/highrise-api/blob/master/sections/people.md).


## Contributing

1. Fork it ( https://github.com/vaberay/HighriseCRM-client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
