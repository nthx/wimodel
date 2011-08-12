require "utils/logging"
require "model/user"


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


      def to_s
        "User: #{name}"
      end
    end

  end
end