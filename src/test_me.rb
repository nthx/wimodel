require "utils/logging"
require "bundler/setup"

require "model/world"
require "model/user"
require "utils/random"
require "lib/andrzejkrzywda-madeleine-cbb4c47/lib/madeleine"



Log.debug('Running diagnosis..')
#world = Model::World.new
Log.debug("Found data leak..")
madeleine = SnapshotMadeleine.new("data/madeleine") do
    Model::World.new
end

world = madeleine.system
Log.debug("-= Living organisms exist here =-")
Log.debug(world)


first_user = world.give_birth_to_amazon_seller('tomcio')
first_user.generate_data

Log.debug('Infection found..')

Log.debug(first_user.present_yourself)
Log.debug('System clean. Going home')
Log.debug("Wait Wait.. #{['not', 'going', 'yet'].sample}")


Log.debug("They must go sleep and NOW")
madeleine.take_snapshot

Log.debug("We destroyed this world and learnt on this mistake")
Log.debug(world)
