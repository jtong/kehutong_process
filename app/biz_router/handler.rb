class Handler
  def initialize name, &handling
    @name = name
    @handling = handling;
  end

  def on (routes)
    @routes = routes
  end

  def next(node)
    @routes= {then:node}
  end

  def handle input
    @handling.call(input)
    return @routes[:then].handle(input)
  end
end