class State
  def initialize name
    @name
  end

  def root_matcher matcher
    @matcher = matcher
  end

  def handle input
    return @matcher.handle(input)
  end

  def self.matcher name, &block
    send :define_method, name do |args = {}|
      if !instance_variable_get("@#{name}")
        instance_variable_set("@#{name}", Matcher.new(name, &block))
      end
      instance_variable_get("@#{name}")
    end
  end

  def self.handler name, &block
    send :define_method, name do |args = {}|
      if !instance_variable_get("@#{name}")
        instance_variable_set("@#{name}", Handler.new(name, &block))
      end
      instance_variable_get("@#{name}")
    end
  end

  def self.response name, &block
    send :define_method, name do |args = {}|
      if !instance_variable_get("@#{name}")
        instance_variable_set("@#{name}", Response.new(name, &block))
      end
      instance_variable_get("@#{name}")
    end
  end

end