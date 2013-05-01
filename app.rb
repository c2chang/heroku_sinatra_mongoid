#app.rb
require 'sinatra'
require 'mongoid'

#Models
load 'coder.rb'

#Loads the mongoid.yml file in your config directory
Mongoid.load!(File.join(File.dirname(__FILE__), "config", "mongoid.yml"))


get '/' do
  #Create new coder document and save to database
  coder = Coder.new(:name => "Chris", :age => 22, :languages => ["Ruby","MongoDB"])
  coder.save
  #Put query results  into an array
  ret = Coder.all.to_a
  #Take document from cursor
  x = ret[0]
  name = x['name']
  age = x['age']
  langList = x['languages']
  langs = '' 
  langList.each {|l| langs << "#{l} "} 
  "Hi my name is #{name}, I'm #{age} years young and I hack in #{langs}"
end
