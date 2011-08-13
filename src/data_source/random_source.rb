require "model/amazon/seller"
require "utils/random"
require "utils/logging"
require "benchmark"


module DataSource

  class RandomSource
    SITES = ['fr', 'it', 'de']
    #MIN_ITEMS=6151461
    #MAX_ITEMS=6222000
    MIN_ITEMS=55000
    MAX_ITEMS=60000
    ITEMS_WITH_REQUESTS=MIN_ITEMS - 5

    def initialize()
      #Log.debug('DataSource.RandomSource.initialize..')
      super()
    end

    def generate_data(seller)
      Log.debug("Fooding #{seller} as much hunger is felt")
      generate_accounts(seller)
      generate_items(seller)
      generate_translation_requests(seller)
    end

    def generate_accounts(seller)
      Log.debug("generate_accounts")
      account_1 = seller.assign_account('US')
      random_site = Random.choice(SITES)
      account_2 = seller.assign_account(random_site)
    end

    def generate_items(seller)
      Log.debug("generate_items")
      account = seller.main_account
      how_many = MIN_ITEMS + rand(MAX_ITEMS-MIN_ITEMS)
      (1..how_many).each do |i|
        seller.fetched_item(account, random_item_id(i))
      end
    end

    def generate_translation_requests(seller)
      Log.debug("generate_translation_requests")
      account = seller.main_account
      items_for_requesting = account.items

      Log.debug("Will request for #{items_for_requesting.length}/#{account.items.length} items")

      benchmark = []
      items_for_requesting.each do |item|
        random_sites = Random.choices(SITES)
        benchmark << Benchmark.measure(label="loop"){
          random_sites.each do |random_site|
            seller.request_translation(item, random_site)
          end
        }
      end
      #Log.debug("\n#{benchmark}")
      Log.debug("Requested")
    end
  end
end