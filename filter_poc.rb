require 'rubygems'
require 'bundler'

Bundler.setup(:default)
Bundler.require

dbconfig = YAML::load(File.open('database.yml'))

#Creating databas connection
ActiveRecord::Base.establish_connection(dbconfig)


get '/' do
  "Hello World. I'm ready"
end
