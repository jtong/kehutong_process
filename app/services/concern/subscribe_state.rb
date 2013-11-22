def_state_description :subsribe do
  input_verify_code_matcher = Matcher.new :input_verify_code_matcher do |input|
    @@test_input_verify_code_matcher == true;
    :then
  end

  verify_code_handler = Handler.new :verify_code_handler do |input|
    puts "I am handle code";
  end

  no_name_matcher = Matcher.new :no_name do |input|
    :then
  end

  change_state_to_member_service_handler = Handler.new :change_state_to_member_service_handler do|input|
    @@current = "member_service"
  end
  change_state_to_waiting_name_input_handler = Handler.new :change_state_to_waiting_name_input_handler do|input|
    @@current = "waiting_name_input"
  end

  response_verify_success = Response.new :response_verify_success do |input|
    "注册成功"
  end

  response_no_name_input = Response.new :response_no_name_input do |input|
    "输入姓名"
  end
end