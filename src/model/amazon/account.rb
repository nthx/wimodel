require "model/amazon/item"
require "utils/logging"


module Model
    module Amazon

        class Account
            attr_accessor :site, :username, :items

            def initialize(site, username=nil)
                @site, @username = site, username
                @items = []
            end

            def fetched_item(item_id)
                item = Model::Amazon::Item.new(@site, item_id)
                @items << item
                item
            end
            
            def has_item(item)
                @items.member?(item)
            end

            def uk_or_us?
                ['uk', 'us'].member?(@site.downcase)
            end
        
            def to_s
                str = []
                items_len = @items.length
                requests_len = 0
                @items.each do |item|
                    requests_len += item.length_of_requests
                end
                str << "Account: #{@username} (#{@site}): items: #{items_len} requests: #{requests_len}"
                #@items.each do |item|
                #    str << item.to_s
                #end
                str.join("\n")
            end
        end

    end
end