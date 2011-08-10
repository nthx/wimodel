require 'rubygems'
require 'log4r'
#require 'log4r/configurator'
 
include Log4r

class MyLog
    def initialize
        @log = Logger.new("my_formatlog")
        pf = PatternFormatter.new(:pattern => "%d %l: %m")
        fo = FileOutputter.new("f2", :filename => "./wimodel.log", :formatter => pf)
 
        @log.outputters = fo
        @log.level = DEBUG
    end
    
    def debug(msg)
        @log.debug(msg)
    end
    def info(msg)
        @log.info(msg)
    end
    def warn(msg)
        @log.warn(msg)
    end
end
 
Log = MyLog.new