require File.join(File.dirname(__FILE__), 'current_instance', 'version')
require File.join(File.dirname(__FILE__), 'current_instance', 'base')
require File.join(File.dirname(__FILE__), 'current_instance', 'class_methods')
# Thread Safe Current Class Instance
#
# Use Like So:
# class User < ActiveRecord::Base
#   include CurrentInstance
# end
#
module CurrentInstance
end
