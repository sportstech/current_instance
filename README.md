# Thread Safe Current Class Instance

## Implementation

Include the gem:

    gem 'current_instance'

Use Like So:

~~~ruby
class User < ActiveRecord::Base
  include CurrentInstance
end
~~~

## Function

Set User.current by assigning an object

~~~ruby
User.current = User.first
User.current #=> <User id: 1, name: "Flinn"...>
  
User.current = nil
User.current #=> nil
~~~

Set Food.current by id

~~~ruby
Food.current_id #=> nil
Food.current_id = 1
Food.current #=> <Food id: 1, name: "Fondue"...>
  
Food.current_id = nil
Food.current #=> nil
~~~

## Travis

{<img src="http://travis-ci.org/chaffeqa/current_instance.png" />}[http://travis-ci.org/chaffeqa/current_instance]

## TODO

* Tests
* Caching