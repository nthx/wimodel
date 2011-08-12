require "model/amazon/account"
require "model/amazon/translation_assistant"
require "model/amazon/seller_presenter"
require "utils/logging"


module Model
    module Amazon

        module Seller
            include Model::Amazon::SellerPresenter
            attr_reader :accounts
    
            def initialize
                #Log.debug('Seller.initialize..')
                @accounts = []
                super()
            end
    
            #def Seller.included(mod)
            #    Log.debug("#{self} included() in #{mod}")
            #end
    
            def assign_account(site)
                account = Model::Amazon::Account.new(site)
                @accounts.push account
                account
            end
            
            def main_account
                @accounts.each do |account|
                    if account.uk_or_us?
                        account
                    end
                end
                if @accounts
                    @accounts[0]
                end
            end
            
            def fetched_item(account, item_id)
                if not @accounts.member?(account)
                    raise 'Account not yours to fetch'
                end
                account.fetched_item(item_id)
            end
            
            def request_translation(item, site)
                assistant = Model::Amazon::TranslationAssistant.new(self)
                assistant.request_translation(item, site)
            end

        end
        
    end
end
