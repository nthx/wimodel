require "model/e/account"

module Seller

    attr_reader :accounts
    
    def initialize
        @accounts = Array.new
    end

    def assign_account(site)
        account = Account.new(site)
        @accounts.push account
    end
        
end