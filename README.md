# GramV1Client
[![Code Climate](https://codeclimate.com/github/Zooip/gram_v1_client/badges/gpa.svg)](https://codeclimate.com/github/Zooip/gram_v1_client) [![Build Status](https://travis-ci.org/Zooip/gram_v1_client.svg?branch=master)](https://travis-ci.org/Zooip/gram_v1_client)
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gram_v1_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gram_v1_client

## Setup
  
  Before being used GramV1Client must be configured. In Rails app, put it in an Initializer.

```ruby
GramV1Client.configure do |c|
   # Base URI used to access GrAM API
   c.site="http://my_site.org/api/v1/"
   # Username provided by Gadz.org
   c.user="my_user"
   # Password provided by Gadz.org
   c.password="my_password"
   # If your app use a proxy to access net, put it here
   #c.proxy="my_proxy"
 end
```
## Usage

This client client is based on the active_ressource gem. [Read its documentation](https://github.com/rails/activeresource) for informations about interacting with ressources
It provides access to the following resources on GrAM API :

 - Account
 - Profile
 - Email
 - Search

###Account
####Find
```ruby
account = GramV1Client::Account.find("john.doe.ext")
puts account.firstname
puts account.lastname
#=> John
#=> Doe
```
####Update
```ruby
account = GramV1Client::Account.find("john.doe.ext")
account.firstname = "Johny"
account.save
```

####Create
```ruby
account = GramV1Client::Account.new(hruid: "john.doe.ext", firstname: "John", lastname: "Doe")
account.save
```
Or
```ruby
account = GramV1Client::Account.create(hruid: "john.doe.ext", firstname: "John", lastname: "Doe")
```

###Profile
####Find
```ruby
profile = GramV1Client::Profile.find("john.doe.ext")
puts account.firstname
puts account.lastname
#=> John
#=> Doe
```

###Email
####Find
```ruby
email = GramV1Client::Email.find("john.doe@gadz.org")
```

###Search
This resource is used to search for accounts

You can use the generic search
```ruby
account = GramV1Client::Search.where(:idSoce => "84185")
```

Or you can use helper methods :
```ruby
account = GramV1Client::Search.search_by_hruid("john.doe.ext")
account = GramV1Client::Search.search_by_id_soce("84185")
account = GramV1Client::Search.search_by_email("john.doe@gadz.org")
account = GramV1Client::Search.search_by_alias("john.doe")
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Zooip/gram_v1_client.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

