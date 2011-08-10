require "utils/logging"


module Model

    module SellerPresenter
        def initialize
            #puts "#{self.class} initialize: #{name}"
        end

        def present_yourself
            str = []
            str << "Presenting Seller: #{name}"
            str << "Accounts: #{@accounts.length}"
            @accounts.each do |account|
                str << account.to_s
            end
            str.join("\n")
        end
        
    end
end
