#app.rb
require 'sinatra'
require 'mongoid'

load 'coder.rb'
load 'config.ru' 

=begin
configure do
  Mongoid.configure do |config|
    config.sessions = {:default => {:hosts => ["dbh85.mongolab.com:27857"], :database => "mongotwitter", :username => "c2chang", :password => "tamader9"}}
  end
end
=end

get '/' do
  coder = Coder.new(:name => "Chris", :age => 22, :languages => ["Ruby","MongoDB"])
  coder.save
  ret = Coder.all.to_a
  name = '', age = '', langList = '', langs = ''
  ret.each {|x| full = x, name = x['name'], age = x['age'], langList = x['languages']} 
  langList.each {|x| langs << "#{x}, "} 
  "Hi, my name is #{name}, I'm #{age} years young and I hack in #{langs}"
end
