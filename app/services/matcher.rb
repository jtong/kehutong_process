class Matcher
  def initialize name, &matching
    @name = name
    @matching = matching;
  end

  def on (routes)
    @routes = routes
  end

  def handle input
    puts @name
    router = @matching.call input
    return @routes[router].handle(input)
  end

end