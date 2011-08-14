require "model/user"
require "utils/logging"


module Model
  module Amazon

    module World
      def initialize
        Log.debug("And me takes part of this world.. it's miiiiinne")
      end

      def give_birth_to_amazon_seller(name)
        #should be Amazon::Seller.new, but not in this project :<
        seller = Model::User.new('tomcio')
        add_user(seller)
      end

    end

  end
end