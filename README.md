# Switchcoder

This gem provides a simple API wrapper to access SwitchCoder from any ruby app.

It is just now getting started.

# Pre-Requisites and Installation

## Prerequisites

You will need to create an account on SwitchCoder and create your API token. This client presumes you have a valid account and API token already configured

## Installation

Add this line to your application's Gemfile:

    gem 'switchcoder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install switchcoder

## Usage

---

## Initializing the SwitchCoder client

    require 'switchcoder';
    client = Switchcoder::Client.new('apiToken', 'host');

## Getting a Phone Number Object

    phone_number = client.phone_number("yourNumber", opts);


## Getting a Code Object  

    // get an instance of the script from the client
    code = client.code(scriptId, phoneNumber, opts);

# Invoking the Code

    //invoke the code with all parameters
    response = code.invoke(queryParameters, requestBody) {|chunk| puts chunk};

    //invoke script with just the callback
    response = code.invoke {|chunk| puts chunk};

## Putting it all together

    require 'switchcoder';
    client = Switchcoder::Client.new('1231232123', 'api.switchcoder.com');
    phone_number = client.phone_number('19195551212');
    code = client.code(123);
    request_parameters = {parameter1:'parameter1Value', parameter2:'parameter2Value'};
    request_body = {bodyValue1:'my text'};

    response = code.invoke(request_parameters, request_body)

    case response
    when Net::HTTPSuccess
      puts "Response status: #{response.code} with data: #{response.body}"
    else
      puts "Got an error: #{response.message}"
    end

---

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
