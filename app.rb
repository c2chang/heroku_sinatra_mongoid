#app.rb
require 'sinatra'
require 'mongoid'

#load your models
load 'coder.rb'

#Depending on where your mongoid.yml file resides, you may want to add ,"config" afterthe File.dirname(__FILE__) parameter
Mongoid.load!(File.join(File.dirname(__FILE__), "mongoid.yml"))


get '/' do
  coder = Coder.new(:name => "Chris", :age => 22, :languages => ["Ruby","MongoDB"])
  coder.save
  #Put resulting cursor into an array
  ret = Coder.all.to_a
  name = '', age = '', langList = '', langs = ''
  ret.each {|x| full = x, name = x['name'], age = x['age'], langList = x['languages']}
  #<< changes the string in place- cool! 
  langList.each {|x| langs << "#{x} "} 
  "Hi my name is #{name}, I'm #{age} years young and I hack in #{langs}"
end
