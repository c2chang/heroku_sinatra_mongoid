heroku_sinatra_mongoid
======================

Short tutorial for getting started on Heroku utilizing Sinatra and Mongoid.

Feel free to contact me via twitter [@c2kc](https://twitter.com/c2kc) or email <chang.christopher@gmail.com> if you have any questions or comments!

Errors
------

If you're getting a sessions error (can't find default), make sure your RACK_ENV is set to production:
    
    heroku config:set RACK_ENV=production
    

