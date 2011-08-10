require "model/user"

u = Model::User.new('tomcio')
account = u.assign_account('US')
item = u.fetched_item(account, '213091283019283012')
translation = u.request_translation(item, 'DE')

puts u.present_yourself

puts "OK. End"
