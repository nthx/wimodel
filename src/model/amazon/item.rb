require "model/amazon/translation_request"
require "utils/utils"
require "set"

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

      def length_of_requests
        @translation_requests.length
      end

      def sites_that_have_request_pending
        sites = Set.new
        @translation_requests.each do |request|
          sites.add(request.site)
        end
        def sites.to_s
          show_set_values(self)
        end
        sites
      end


      def to_s
        "Item #{@site} #{@item_id}, #{@translation_requests.length} requests #{sites_that_have_request_pending}"
      end
    end

  end
end