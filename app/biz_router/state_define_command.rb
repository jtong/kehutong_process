module StateDefineCommand
  def matcher name, &block
    send :define_method, name do |args = {}|
      if !instance_variable_get("@#{name}")
        instance_variable_set("@#{name}", Matcher.new(name, &block))
      end
      instance_variable_get("@#{name}")
    end
  end

  def handler name, &block
    send :define_method, name do |args = {}|
      if !instance_variable_get("@#{name}")
        instance_variable_set("@#{name}", Handler.new(name, &block))
      end
      instance_variable_get("@#{name}")
    end
  end

  def response name, &block
    send :define_method, name do |args = {}|
      if !instance_variable_get("@#{name}")
        instance_variable_set("@#{name}", Response.new(name, &block))
      end
      instance_variable_get("@#{name}")
    end
  end
end