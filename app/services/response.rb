class Response
  def initialize name, &responsing
    @name = name
    @responsing = responsing
  end

  def handle input
    return @responsing.call(input)
  end
end