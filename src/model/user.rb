require "model/amazon/seller"
require "utils/logging"
require "lib/andrzejkrzywda-madeleine-cbb4c47/lib/madeleine"
require "lib/andrzejkrzywda-madeleine-cbb4c47/lib/madeleine/automatic"


module Model

  class User
    include Madeleine::Automatic::Interceptor
    automatic_read_only :to_s, :present_yourself

    include Model::Amazon::Seller

    def initialize(last_name, first_name=nil)
      Log.debug('Species growing..')
      @first_name, @last_name = first_name, last_name
      super()
    end

    def name
      "#{@last_name} #{@first_name}"
    end

    def to_s
      "a #{name}"
    end
  end
end