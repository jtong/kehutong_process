module DefAlias
  def def_matcher name, &matching
    Matcher.new name, &matching
  end

  def def_handler name, &handling
    Handler.new name, &handling
  end

  def def_response name, &responsing
    Response.new name, &responsing
  end
end