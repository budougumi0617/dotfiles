
begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError
end

# histroy
require 'irb/ext/save-history'
IRB.conf[:HISTORY_FILE] = "~/.irb_history"
IRB.conf[:SAVE_HISTORY] = 100000
