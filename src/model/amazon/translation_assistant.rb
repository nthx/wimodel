require "utils/logging"


module Model
  module Amazon

    class TranslationAssistant

      def initialize(seller)
        #puts "#{self.class}.initialize for #{seller}"
        @seller = seller
      end

      def find_account(item)
        @seller.accounts.detect do |account|
          account.has_item(item)
        end
      end

      def request_translation(item, site)
        account = find_account(item)
        if not account
          raise 'Item not in an account'
        end
        item.new_request(site)
      end
    end
  end
end