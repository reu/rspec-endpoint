# Rspec::Endpoint

[![Build Status](https://api.travis-ci.org/reu/rspec-endpoint.svg?branch=master)](http://travis-ci.org/reu/rspec-endpoint)

RSpec::Endpoint provides the `endpoint` method as a helper to test HTTP requests. It parses and replaces the description with the informed params.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "rspec-endpoint"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-endpoint

And require it as:

```ruby
require "rspec/endpoint"
```

## Example

```ruby
RSpec.descripe UserApi do
  endpoint "GET /users/:user_id" do
    let(:user_id) { 10 }

    it { expect(path).to eq "/users/10" }
    it { expect(params).to eq user_id: 10 }
  end
end
```

`rspec-endpoint` will define a named subject `make_request` which calls the provided path using the http verb.

```ruby
RSpec.descripe UserApi do
  endpoint "POST /users/:user_id" do
    let(:user_id) { 10 }

    it do
      # Named subject, same as:
      #   post path, params
      #
      # `params` here is `{ user_id: user_id }`
      make_request

      expect(response).to be_success
    end
  end
end
```
