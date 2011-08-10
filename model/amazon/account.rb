require "model/amazon/item"

module Model
    module Amazon

        class Account
            attr_accessor :site, :username

            def initialize(site, username=nil)
                #puts "#{self.class}.initialize"
                @site, @username = site, username
                @items = []
            end

            def fetched_item(item_id)
                #puts "fetched_item: #{item_id}"
                item = Model::Amazon::Item.new(@site, item_id)
                @items << item
                item
            end
            
            
            def has_item(item)
                @items.member?(item)
            end

            
            def to_s
                "Account: #{@username} (#{@site}): items: #{@items.length}"
                if @items.length
                    @items.each do |item|
                        puts item
                    end
                end
            end
        end

    end
end