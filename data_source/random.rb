require "model/amazon/seller"
require "utils/random"
require "utils/logging"


module DataSource
    module RandomSource
        SITES = ['fr', 'it', 'de']
        MIN_ITEMS=30
        MAX_ITEMS=50
        ITEMS_WITH_REQUESTS=20
        
        def initialize()
            #Log.debug('DataSource.RandomSource.initialize..')
            super()
        end
    
        def generate_data
            seller = self
            Log.debug("Fooding #{seller} as much hunger is present")
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
            how_many = MIN_ITEMS + rand(MAX_ITEMS)
            (1..how_many).each do |i|
                seller.fetched_item(account, random_item_id(i))
            end
        end
        
        def generate_translation_requests(seller)
            account = seller.main_account
            items_for_requesting = Random.choices(account.items, ITEMS_WITH_REQUESTS)
            
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