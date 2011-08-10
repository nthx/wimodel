require "model/amazon/seller"

module Model
    class User
        include Model::Seller
        
        def initialize(last_name, first_name=nil)
            #puts "User.initialize #{last_name}"
            @first_name, @last_name = first_name, last_name
            super()
        end
    
        
        def name
            "#{@last_name} #{@first_name}"
        end
        
    
        def to_s
            "User: #{name}"
        end
    end
end