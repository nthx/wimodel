module Model
    module Amazon

        class TranslationRequest
            attr_accessor :site, :state
            
            def initialize(site)
                @site = site
            end

            
            def to_s
                "Request to #{@site.upcase}"
            end
        end

    end
end