require "model/amazon/account"

module Model
    

    module Seller
        attr_reader :accounts
        def initialize
            puts "#{self.class} initialize: @name: #{@name} vs self.name: #{self.name}"
            @accounts = []
        end

        def Seller.included(mod)
            puts "#{self} included() in #{mod}"
        end

        def assign_account(site)
            puts "assign_account: #{site}.."
            account = Model::Amazon::Account.new(site)
            self.accounts.push account
            account
        end
        
        
        def fetched_item(account, item_id)
            #if account not in self.accounts:
            #    raise Error
            #end
            account.fetched_item(item_id)
        end
        
        
        def present_yourself
            puts "Presenting Seller: #{self.name}"
            
            puts "Accounts: #{self.accounts.length}"
            
            self.accounts.each do |account| 
                puts account.inspect()
                #why puts account stopped working after moving to Model::Seller?
            end
        end
        
    end
    
    
    
end
