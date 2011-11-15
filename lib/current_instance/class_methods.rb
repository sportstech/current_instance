module CurrentInstance
  module ClassMethods


    # Set Food.current by id:
    #     Food.current_id #=> nil
    #     Food.current_id = 1
    #     Food.current #=> #<Food id: 1, name: "Fondue"...>
    #     Food.current_id = nil
    #     Food.current #=> nil
    def current_id
      Thread.current[current_name_id]
    end


    def current_id=(current_id)
      Thread.current[current_name_id] = current_id
    end

    # Set User.current by assigning an object:
    #     User.current = User.first
    #     User.current #=> #<User id: 1, name: "Flinn"...>
    #     User.current = nil
    #     User.current #=> nil
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
end
