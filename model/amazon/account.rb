require "model/amazon/item"

module Model
    module Amazon

        class Account
            attr_accessor :site, :username

            def initialize(site, username=nil)
                puts "#{self.class}.initialize"
                @site, @username = site, username
                @items = []
            end

            def fetched_item(item_id)
                puts "fetched_item: #{item_id}"
                item = Model::Amazon::Item.new(@site, item_id)
                @items << item
            end

            
            def inspect
                "Account: #{@username} (#{@site}): items: #{@items.length}"
            end
        end

    end
end