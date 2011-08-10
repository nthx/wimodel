require "model/amazon/translation_request"

module Model
    module Amazon

        class Item
            attr_accessor :site, :item_id, :url

            def initialize(site, item_id)
                @site, @item_id = site, item_id
                @translation_requests = []
            end
            
            
            def new_request(site)
                request = Model::Amazon::TranslationRequest.new(site)
                @translation_requests << request
            end


            def to_s
                str = []
                str << "Item: #{@item_id} requests: #{@translation_requests.length}"
                @translation_requests.each do |request|
                    str << request.to_s
                end
                return str.join("\n")
            end
        end

    end
end