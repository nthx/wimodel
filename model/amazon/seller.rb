require "model/amazon/account"
require "model/amazon/translation_assistant"

module Model
    

    module Seller
        attr_reader :accounts
        def initialize
            #puts "#{self.class} initialize: @name: #{@name} vs self.name: #{self.name}"
            @accounts = []
        end

        #def Seller.included(mod)
        #    puts "#{self} included() in #{mod}"
        #end

        def assign_account(site)
            puts "assign_account: #{site}.."
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
