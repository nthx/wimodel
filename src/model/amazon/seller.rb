require "model/amazon/account"
require "model/amazon/translation_assistant"
require "model/amazon/seller_presenter"
require "utils/logging"


module Model
  module Amazon

    module Seller
      include Model::Amazon::SellerPresenter

      attr_reader :accounts

      def initialize
        #Log.debug('Seller.initialize..')
        @accounts = []
        super()
      end

      #def Seller.included(mod)
      #    Log.debug("#{self} included() in #{mod}")
      #end

      def assign_account(site, username)
        account = Model::Amazon::Account.new(site, username)
        add_account(account)
      end
      
      def add_account(account)
        @accounts << account
        account
      end

      def main_account
        account = @accounts.detect do |account|
          account.uk_or_us?
        end || any_account
      end
      
      def any_account
          @accounts.any? ? @accounts[0] : nil
      end
      
      def find_account_by_username(username)
        return @accounts.detect do |account|
          account.username == username
        end
      end

      def fetched_item(account_username, item_id)
        account = find_account_by_username(account_username)
        if not @accounts.member?(account)
          raise 'Account not yours to fetch'
        end
        account.fetched_item(item_id)
      end

      def request_translation(item, site)
        assistant = Model::Amazon::TranslationAssistant.new(self)
        assistant.request_translation(item, site)
      end

    end

  end
end
