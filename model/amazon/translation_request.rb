module Model
    module Amazon
        attr_accessor :site, :state

        class TranslationRequest
            def initialize(site)
                @site = site
            end

            
            def to_s
                "Requested to #{@site}"
            end
        end

    end
end