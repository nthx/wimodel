module Model
    module Amazon
        attr_accessor :site, :state

        class TranslationRequest
            def initialize(site)
                @site = site
            end

            
            def to_s
                "Item: #{@item_id}"
            end
        end

    end
end