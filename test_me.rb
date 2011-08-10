require "utils/logging"
require "model/user"
require "bundler/setup"
require "madeleine"


Log.debug('Running diagnosis..')

u = Model::User.new('tomcio')
u.generate_data


Log.debug('Infection found..')

Log.debug(u.present_yourself)
Log.debug('System clean. Going home')
