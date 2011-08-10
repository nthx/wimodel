require "model/user"

u = Model::User.new('tomcio')
account = u.assign_account('US')

u.fetched_item(account, '213091283019283012')

u.present_yourself
