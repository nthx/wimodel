require "model/amazon/seller"
require "utils/logging"


module DataSource
    module Random
        def initialize()
            Log.debug('DataSource.Random.initialize..')
            super()
        end
    
        #def Random.included(mod)
        #    Log.debug("#{self} included() in #{mod}")
        #end

        def generate_data
            u = self
            Log.debug("generate_data. User found: #{u}")
            account = u.assign_account('US')
            item = u.fetched_item(account, '213091283019283012')
            translation = u.request_translation(item, 'DE')
        end
    end
end