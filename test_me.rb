require "utils/logging"
require "model/user"
require "bundler/setup"
require "lib/andrzejkrzywda-madeleine-cbb4c47/lib/madeleine"
require "utils/random"



Log.debug('Running diagnosis..')

u = Model::User.new('tomcio')
u.generate_data

Log.debug('Infection found..')

Log.debug(u.present_yourself)
Log.debug('System clean. Going home')

Log.debug("Wait Wait.. #{Random.choice(['bye', 'hello', 'hi'])}")

