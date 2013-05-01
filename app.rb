#app.rb
require 'sinatra'
require 'mongoid'

load 'coder.rb'
=begin
configure do
  Mongoid.configure do |config|
    config.sessions = {:default =>  {:hosts => ["dbh85.mongolab.com:27857"], :database => "mongotwitter", :username => "c2chang", :password => "tamader9"}}
  end
end
=end

puts File.join(File.dirname(__FILE__), "mongoid.yml") 
Mongoid.load!(File.join(File.dirname(__FILE__), "mongoid.yml"))

=begin
configure :development do
  enable :logging, :dump_errors, :run, :sessions
  #Mongoid.load!(File.join(File.dirname(__FILE__), "config", "mongoid.yml"))
  puts File.join(File.dirname(__FILE__), "mongoid.yml") 
  Mongoid.load!(File.join(File.dirname(__FILE__), "mongoid.yml"))
end
=end

get '/' do
  puts 'executing'
  coder = Coder.new(:name => "Chris", :age => 22, :languages => ["Ruby","MongoDB"])
  puts 'stuck'
  coder.save
  puts 'not stuck'
  ret = Coder.all.to_a
  name = '', age = '', langList = '', langs = ''
  ret.each {|x| full = x, name = x['name'], age = x['age'], langList = x['languages']} 
  langList.each {|x| langs << "#{x} "} 
  "Hi my name is #{name}, I'm #{age} years young and I hack in #{langs}"
end
