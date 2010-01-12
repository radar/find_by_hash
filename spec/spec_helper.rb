$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
begin
  require 'rubygems'
rescue LoadError
end

require 'spec'
require 'spec/autorun'
require 'active_record'

require 'find_by_hash'
# Just like a real rails app!
require 'rails/init'

ActiveRecord::Base.establish_connection(:database => "find_by_hash.sqlite3", :adapter => "sqlite3")
load 'initializers/schema.rb'

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each { |f| require f }

Spec::Runner.configure do |config|
  config.mock_with :mocha
end
