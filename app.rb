#app.rb
require 'sinatra'
require 'mongoid'

load 'coder.rb'

#mongodb://heroku_app15392573:uredidq4ub5ud4c136vjb4jpg7@ds061767.mongolab.com:61767/heroku_app15392573

configure do
  Mongoid.configure do |config|
    config.sessions = {:default => :uri => "mongodb://heroku_app15392573:uredidq4ub5ud4c136vjb4jpg7@ds061767.mongolab.com:61767/heroku_app15392573"}
=begin
{:hosts => ["dbh85.mongolab.com:27857"], :database => "mongotwitter", :username => "c2chang", :password => "tamader9"}}
=end
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
