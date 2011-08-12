require "utils/logging"
require "model/amazon/world"


module Model
  class World
    include Model::Amazon::World

    def initialize()
      Log.debug("Yyy..ah.. that's place I could live in")

      @users = []
      super()
    end

    def add_user(user)
      @users << user
      user
    end

    def to_s
      "Earth here: #{@users.length} and counting.."
    end
  end
end
