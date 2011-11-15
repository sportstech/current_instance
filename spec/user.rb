require 'active_support/core_ext'
class User
  include CurrentInstance
  
  attr_accessor :id, :other
  
  def initialize(options)
    @id = options[:id]
    @other = options[:other]
  end
  
end