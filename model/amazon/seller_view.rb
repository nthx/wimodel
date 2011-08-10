module Model
    module SellerPresenter
        def present_yourself
            puts "Presenting Seller: #{@name}"
            
            puts "Accounts:"

            @accounts.each do |account| 
                puts account.to_s
            end

            
        end
    end
    
end

    