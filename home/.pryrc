Pry.history.load
begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError
end
