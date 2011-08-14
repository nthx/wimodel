require "model/amazon/seller"
require "utils/random"
require "utils/logging"
require "benchmark"


module DataSource

  class RandomSource
    SITES = ['fr', 'it', 'de']
    #ITEMS_NO=6151461
    
    ITEMS_NO=600_000

    def initialize()
      #Log.debug('DataSource.RandomSource.initialize..')
      super()
    end

    def generate_data(seller)
      Log.debug("Fooding #{seller} as much hunger is felt")
      benchmark = []
      requests_no = 0
      
      benchmark << Benchmark.measure(){
        generate_accounts(seller)
      }
      benchmark << Benchmark.measure(){
        generate_items(seller)
      }
      benchmark << Benchmark.measure(){
        requests_no = generate_translation_requests(seller)
      }
      Log.debug(benchmark)

      Log.debug("Data added: Items: #{ITEMS_NO}, Requests: #{requests_no}")
      Log.debug("Commands/s (new item): #{1/(benchmark[1].real/ITEMS_NO)}")
      Log.debug("Commands/s (request translation): #{1/(benchmark[2].real/requests_no)}")
    end

    def generate_accounts(seller)
      Log.debug("generate_accounts")
      account_1 = seller.assign_account('US', Random.random_text())
      random_site = Random.choice(SITES)
      account_2 = seller.assign_account(random_site, Random.random_text())
    end

    def generate_items(seller)
      Log.debug("generate_items")
      account = seller.main_account
      ITEMS_NO.times do |idx|
        seller.fetched_item(account.username, random_item_id(idx))
        if idx % 100 == 0
          Log.debug("generate_items: #{(idx.to_f/ITEMS_NO*100).round(2)}%")
        end
      end
    end

    def generate_translation_requests(seller)
      Log.debug("generate_translation_requests")
      account = seller.main_account
      items_for_requesting = account.items
      requests_no = 0

      Log.debug("Will request for #{items_for_requesting.length}/#{account.items.length} items")

      items_for_requesting.each_with_index do |item, idx|
        random_sites = Random.choices(SITES)
        random_sites.each do |random_site|
          seller.request_translation(item, random_site)
          requests_no += 1
        end
        if idx % 100 == 0
          Log.debug("generate_translation_requests: #{(idx.to_f/items_for_requesting.length*100).round(2)}%")
        end

      end
      Log.debug("Requested: #{requests_no}")
      requests_no
    end
  end
end