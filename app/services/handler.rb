class Handler
  def initialize name, &handling
    @name = name
    @handling = handling;
  end

  def on (routes)
    @routes = routes
  end

  def handle input
    puts @name
    @handling.call(input)
    return @routes[:then].handle(input)
  end
end