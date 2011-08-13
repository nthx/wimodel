require "utils/logging"


module Model
  module Amazon

    module SellerPresenter

      def initialize
      end

      def present_yourself
        str = []
        str << "-= TaDaaaa Presents =-"
        str << "#{name} has #{@accounts.length} accounts"
        @accounts.each do |account|
          str << account.to_s
        end
        str.join("\n")
      end

    end

  end
end
