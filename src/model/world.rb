require "model/amazon/world"
require "utils/logging"
require "lib/andrzejkrzywda-madeleine-cbb4c47/lib/madeleine"
require "lib/andrzejkrzywda-madeleine-cbb4c47/lib/madeleine/automatic"


module Model

  class World
    include Madeleine::Automatic::Interceptor
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
