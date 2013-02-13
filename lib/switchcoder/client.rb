module Switchcoder 

  class Client

    attr_reader :host, :api_token, :opts

    def initialize(api_token, host = nil, opts = nil)
      @api_token = api_token;
      @host = host || 'api.switchcoder.com';
      @opts = (opts || {}).inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
    end

    def phone_number(num,opts = nil)
      PhoneNumber.new(num, opts)
    end

    def code(id, phone_number = nil, opts = nil)
      script = Code.new(id, phone_number, opts)
      script.client = self
      return script
    end
  end

end