#app.rb
require 'sinatra'
require 'mongoid'

load 'coder.rb'

host = "dsxxxxxx.mongolab.com:xxxxx"
db = "heroku_appxxxxxx"
dbuser = "heroku_appxxxxxx"
dbpass = "xxxxxxxxxxxxxxx"

configure do
  Mongoid.configure do |config|
    config.sessions = {:default => {:hosts => ["ds061767.mongolab.com:61767"], :database => "heroku_app15392573", :username => "c2chang", :password => "tamader"}}
  end
end

get '/' do
  coder = Coder.new(:name => "Chris", :age => 22, :languages => ["Ruby","MongoDB"])
  coder.save
  ret = Coder.all.to_a
  name = '', age = '', langList = '', langs = ''
  ret.each {|x| full = x, name = x['name'], age = x['age'], langList = x['languages']} 
  langList.each {|x| langs << "#{x} "} 
  "Hi my name is #{name}, I'm #{age} years young and I hack in #{langs}"
end
