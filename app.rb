#app.rb
require 'sinatra/base'
require 'mongoid'

load 'coder.rb'
=begin
configure do
  Mongoid.configure do |config|
    config.sessions = {:default =>  {:hosts => ["ds061767.mongolab.com:61767"], :database => "heroku_app15392573", :username => "heroku_app15392573", :password => "uredidq4ub5ud4c136vjb4jpg7"}}
  end
end
=end

configure :development do
  enable :logging, :dump_errors, :run, :sessions
  Mongoid.load!(File.join(File.dirname(__FILE__), "config", "mongoid.yml"))
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
