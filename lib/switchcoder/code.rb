require 'net/http'
require 'net/https'

module Switchcoder 
  
  class Code

    attr_accessor :client
    attr_reader :id, :phone_number, :opts

    def initialize(id, phone_number = nil, opts = nil)
        @id = id;
        @phone_number = phone_number;
        @opts = opts;
    end

    # This method returns a Net::HTTPResponse object.
    #
    # If called with a block, yields each fragment of the entity body 
    # in turn as a string as it is read from the socket. 
    # Note that in this case, the returned response object will not contain a (meaningful) body.
    
    def invoke(query_parameters = {}, body = "", query_headers = nil)
      query_parameters ||= {}
      body ||= ""

      headers = {'Content-Type' => 'application/json', 'api_token' => client.api_token.to_s}
      headers["phone_number"] = @phone_number.number.to_s if @phone_number

      # add user headers to common headers
      headers.merge!( query_headers ) if query_headers


      uri = URI("https://#{client.host}/code/#{@id}/invoke")
      uri.query = URI.encode_www_form(query_parameters)

      http = Net::HTTP.new( uri.host, uri.port )
      http.use_ssl = (uri.scheme == 'https')
      
      res = http.start do |http|
        if client.opts[:method].to_s.downcase == 'get'
          http.get(uri.request_uri, headers) { |str| yield str if block_given? }
        else
          headers['Content-Length'] = body.length.to_s
          http.post(uri.request_uri, body, headers)  { |str| yield str if block_given? }
        end
      end

      return res
    end

  end

end