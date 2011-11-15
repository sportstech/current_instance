require "current_instance/version"

# Thread Safe Current Class Instance
#
# Add this to lib/sports_tech/current_instance.rb
#
# Use Like So:
# class User < ActiveRecord::Base
#   include SportsTech::Model::Current
# end
#

# Set User.current by assigning an object
# User.current = User.first
# User.current #=> #<User id: 1, name: "Flinn"...>
# User.current = nil
# User.current #=> nil

# Set Food.current by id
# Food.current_id #=> nil
# Food.current_id = 1
# Food.current #=> #<Food id: 1, name: "Fondue"...>
# Food.current_id = nil
# Food.current #=> nil

module CurrentInstance
  
  module ClassMethods
    def current_id
      Thread.current[current_name_id]
    end

    def current_id=(current_id)
      Thread.current[current_name_id] = current_id
    end

    def current
      unless current_id.blank?
        Thread.current[current_name] ||= self.respond_to?(:cached_find_by_id) ?
          cached_find_by_id(current_id) :
          find_by_id(current_id)
      end
    end

    def current=(current)
      Thread.current[current_name] = current
      self.current_id = current.blank? ? nil : (current.id rescue nil)
    end
  end
  
  def self.included(base)
    base.class_eval %q{
      @@current_name = "current_#{base.name.downcase}".to_sym
      cattr_accessor :current_name
      @@current_name_id = "#\{@@current_name\}_id".to_sym
      cattr_accessor :current_name_id
    }
    base.extend(ClassMethods)
  end
end