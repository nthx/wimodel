require "utils/logging"
require "bundler/setup"

require "model/world"
require "model/user"
require "utils/random"
require "lib/andrzejkrzywda-madeleine-cbb4c47/lib/madeleine"
require "lib/andrzejkrzywda-madeleine-cbb4c47/lib/madeleine/automatic"


Log.debug('Running diagnosis..')
random_source = DataSource::RandomSource.new()

Log.debug("Found data leak..repairing..")
madeleine = AutomaticSnapshotMadeleine.new("data/madeleine", Madeleine::ZMarshal.new(YAML)) do
  Model::World.new
end

world = madeleine.system
Log.debug("Living organisms exist here.. exterminate")
Log.debug(world)

first_user = world.give_birth_to_amazon_seller('tomcio')

#account = first_user.assign_account('US', Random.random_text())
#first_user.fetched_item(account.username, random_item_id(idx))
#first_user.request_translation(item, random_site)

random_source.generate_data(first_user)

Log.debug('Infection found..')

Log.debug(first_user.present_yourself)
Log.debug('System clean. Going home')
Log.debug("Wait Wait.. #{['not', 'going', 'yet'].sample}")


Log.debug("They must go sleep and NOW")
madeleine.take_snapshot

Log.debug("We destroyed this world and learnt on this mistake")
Log.debug(world)
