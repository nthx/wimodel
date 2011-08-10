require "model/amazon/item"
require "utils/logging"


module Model
    module Amazon

        class Account
            attr_accessor :site, :username

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

            
            def to_s
                str = []
                str << "Account: #{@username} (#{@site}): items: #{@items.length}"
                @items.each do |item|
                    str << item.to_s
                end
                str.join('\n')
            end
        end

    end
end