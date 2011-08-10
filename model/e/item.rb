module Model
    module E

        class Item
            attr_accessor :site, :item_id, :url

            def initialize(site, item_id)
                @site, @item_id = site, item_id
            end


            def inspect
                "Item: #{@item_id}"
            end
        end

    end
end