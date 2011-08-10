class Account
    attr_accessor :site, :username

    def initialize(site, username=nil)
        @username = username
        @site = site
    end


    def inspect
        "Account: #{username} (#{@site})"
    end


end