Fyber webclient
---------------

Design Ideas
============

There're different approaches when implementing a client API, my desicion involves wrapping the API in the business concept
avoinding internal exposition, ex: the user should be concerned about knowing the connection class or how the request is formed,
but instead should be aware of the logics behind the interface. For that reason I decied to implemement a simple Fyber:: module
who hides all this stuff from the user.


### Configuration 

We can configure the API using both a configure block or a configure hash during class initialization. 

Fyber.configure do |config| 
    config.appid = "123"
end

Fyber::Client::Offer.new({:appid => "123"})

You should remind that the above method does change the Fyber config outside the instance context. 

### Public interfaces

Fyber::Configuration => Handles the fyber module configuration, predefined request parameters ...
Fyber::Client => Handles a simple connection with fyber backend to perform actions

### Hidden interfaces

Fyber::Client


Testing
=======

