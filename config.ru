# config.ru

configure do
  Mongoid.configure do |config|
    config.sessions = {:default => {:hosts => ["dbh85.mongolab.com:27857"], :database => "mongotwitter", :username => "c2chang", :password => "tamader9"}}
  end
end

require "./app"
run Sinatra::Application


