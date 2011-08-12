require "model/amazon/seller"
require "utils/random"
require "utils/logging"


module DataSource
    module RandomSource
        SITES = ['fr', 'it', 'de']
        
        def initialize()
            Log.debug('DataSource.RandomSource.initialize..')
            super()
        end
    
        #def RandomSource.included(mod)
        #    Log.debug("#{self} included() in #{mod}")
        #end

        def generate_data
            seller = self
            Log.debug("generate_data. User found: #{seller}")
            generate_accounts(seller)
            generate_items(seller)
            generate_translation_requests(seller)
        end
        
        
        def generate_accounts(seller)
            account_1 = seller.assign_account('US')
            random_site = Random.choice(SITES)
            account_2 = seller.assign_account(random_site)
        end
        
        def generate_items(seller)
            account = seller.main_account
            how_many = 5 + rand(10)
            (1..how_many).each do |i|
                seller.fetched_item(account, "12349900#{i}")
            end
        end
        
        def generate_translation_requests(seller)
            account = seller.main_account
            how_many = 2 + rand(account.items.length - 2) #items length >=5..so 2 is safe
            items_for_requesting = account.items.select do |item|
                should_request = rand(3) >= 1
                should_request
            end
            
            Log.debug("Will request for #{items_for_requesting.length}/#{account.items.length} items")
            
            items_for_requesting.each do |item|
                random_sites = Random.choices(SITES)
                random_sites.each do |random_site|
                    seller.request_translation(item, random_site)
                end
            end
        end
    end
end