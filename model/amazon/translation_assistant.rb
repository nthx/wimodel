require "utils/logging"


module Model
    module Amazon
        class TranslationAssistant
            
            def initialize(seller)
                #puts "#{self.class}.initialize for #{seller}"
                @seller = seller
            end
            
            def find_account(item)
                #puts "find_account.. #{item}"
                for account in @seller.accounts:
                    if account.has_item(item)
                        account
                    end
                end
            end
            
            
            def request_translation(item, site)
                account = find_account(item)
                #puts "Account found: #{account}"
                if not account
                    raise ArgumentError('Item not in an account')
                end
                item.new_request(site)
            end
        end
    end
end