require "model/e/item"

module Model
    module E

        class Account
            attr_accessor :site, :username

            def initialize(site, username=nil)
                @username = username
                @site = site
                
                @items = []
            end

            def inspect
                "Account: #{@username} (#{@site})"
            end
            

            def fetched_item(item_id)
                item = Model::E::Item.new(@site, item_id)
                @items << item
            end
            
        end

    end
end