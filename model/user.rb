require "model/amazon/seller"
require "data_source/random"
require "utils/logging"


module Model
    class User
        include Model::Amazon::Seller
        include DataSource::RandomSource
        
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