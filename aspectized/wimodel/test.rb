require "model/user"

u = User.new('tomcio')

u.assign_account('US')

p u
p "Accounts: ", u.accounts

