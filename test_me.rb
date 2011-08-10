require "model/user"
require "utils/logging"


Log.debug('-' * 80)
Log.debug('Running diagnosis..')

u = Model::User.new('tomcio')
account = u.assign_account('US')
item = u.fetched_item(account, '213091283019283012')
translation = u.request_translation(item, 'DE')

Log.debug('Infection found..')

Log.debug(u.present_yourself)
Log.debug('System clean. Going home')
