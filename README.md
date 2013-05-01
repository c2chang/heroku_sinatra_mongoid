heroku_sinatra_mongoid
======================

Short tutorial for getting started on Heroku utilizing Sinatra and Mongoid.

Just type the following to execute:
    
    ruby app.rb
    
Note: you must add the MongoLab addon (heroku addons:add mongolab) to use the uri variable in mongoid.yml.

Documentation: [MongoLab on Heroku](https://devcenter.heroku.com/articles/mongolab) and [Mongoid](http://mongoid.org/en/mongoid/docs/installation.html).

Feel free to contact me via twitter [@c2kc](https://twitter.com/c2kc) or email <chang.christopher@gmail.com> if you have any questions or comments!

Errors
------

If you're getting a sessions error "can't find default", make sure your RACK_ENV is set to production:
    
    heroku config:set RACK_ENV=production
    

