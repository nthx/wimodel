#require "model/e/account"
require "model/e/seller"

module Model
    class User
        include Seller
        
        def initialize(last_name, first_name=nil)
            @first_name, @last_name = first_name, last_name
            super()
        end
    
        
        def name
            "#{@last_name} #{@first_name}"
        end
        
    
        def inspect
            "User: #{name}"
        end
    end
end