require 'json'
require 'spec_helper'

describe Switchcoder do
  it "should do GET and return Net::HTTPResponse" do
    
    client = Switchcoder::Client.new('1231232123', 'api.switchcoder.com', method: :get);
    phone_number = client.phone_number('19195551212');
    code = client.code(123);
    request_parameters = {parameter1:'parameter1Value', parameter2:'parameter2Value'};
    request_body = {bodyValue1:'my text'};

    response = code.invoke(request_parameters, request_body.to_json)

    response.should be_a Net::HTTPResponse

  end

  it "should do GET and return Net::HTTPResponse" do
    
    client = Switchcoder::Client.new('1231232123', 'api.switchcoder.com');
    phone_number = client.phone_number('19195551212');
    code = client.code(123);
    request_parameters = {parameter1:'parameter1Value', parameter2:'parameter2Value'};
    request_body = {bodyValue1:'my text'};

    response = code.invoke(request_parameters, request_body.to_json)

    response.should be_a Net::HTTPResponse

  end
end