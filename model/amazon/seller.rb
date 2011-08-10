require "model/amazon/account"
require "model/amazon/translation_assistant"
require "model/amazon/seller_presenter"

module Model

    module Seller
        include Model::SellerPresenter
        attr_reader :accounts

        def initialize
            @accounts = []
            super()
        end

        #def Seller.included(mod)
        #    puts "#{self} included() in #{mod}"
        #end

        def assign_account(site)
            account = Model::Amazon::Account.new(site)
            @accounts.push account
            account
        end
        
        
        def fetched_item(account, item_id)
            if not @accounts.member?(account)
                raise Exception('Account not yours to fetch')
            end
            account.fetched_item(item_id)
        end
        
        def request_translation(item, site)
            assistant = Model::Amazon::TranslationAssistant.new(self)
            assistant.request_translation(item, site)
        end
        
        
    end
end
