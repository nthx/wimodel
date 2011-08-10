require "model/amazon/account"
require "model/amazon/seller_view"

module Model
    

    module Seller
        include SellerPresenter
        attr_reader :accounts

        def initialize
            puts "Seller.initialize()"
            @accounts = []
            super()
        end
        
        def included
            puts "Seller.included()"
        end

        def assign_account(site)
            account = Model::Amazon::Account.new(site)
            @accounts.push account
            account
        end
        
        
        def fetched_item(account, item_id)
            #if account not in @accounts:
            #    raise Error
            #end
            account.fetched_item(item_id)
        end
    end
    
    
    
end
