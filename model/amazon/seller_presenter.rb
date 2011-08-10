module Model

    module SellerPresenter
        def initialize
            #puts "#{self.class} initialize: #{name}"
        end

        def present_yourself
            str = []
            str << "Presenting Seller: #{self.name}"
            str << "Accounts: #{@accounts.length}"
            self.accounts.each do |account| 
                str << account.to_s
            end
            str.join('\n')
        end
        
    end
end
