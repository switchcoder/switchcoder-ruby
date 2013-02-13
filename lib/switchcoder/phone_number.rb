module Switchcoder 
  
  class PhoneNumber

    attr_reader :number

    def initialize(num, opts = nil)
        @number = num;
        @opts = opts;
    end
  end

end