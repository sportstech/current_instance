module CurrentInstance
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