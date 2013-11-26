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



end