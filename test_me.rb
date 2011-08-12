require "utils/logging"
require "bundler/setup"

require "model/world"
require "model/user"
require "utils/random"
require "lib/andrzejkrzywda-madeleine-cbb4c47/lib/madeleine"



Log.debug('Running diagnosis..')
world = Model::World.new

first_user = world.give_birth_to_amazon_seller('tomcio')
first_user.generate_data

Log.debug('Infection found..')

Log.debug(first_user.present_yourself)
Log.debug('System clean. Going home')
Log.debug("Wait Wait.. #{Random.choices(['not', 'going', 'yet'])}")
Log.debug("Found data leak..")


madeleine = SnapshotMadeleine.new("data/madeleine") {
    world
}
Log.debug("-= Living organisms =-")
Log.debug(madeleine)

Log.debug("They must go sleep and NOW")
madeleine.take_snapshot

