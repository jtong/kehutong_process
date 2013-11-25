class SubscribeState < State

  include SubscribeStateRouter

  matcher :input_verify_code_matcher do |input|
    :then
  end

  handler :verify_code_handler do |input|
    puts "I am handle code";
  end

  matcher :no_name_matcher do |input|
    :then
  end

  handler :change_state_to_member_service_handler do|input|
    @@current = "member_service"
  end

  handler :change_state_to_waiting_name_input_handler do|input|
    @@current = "waiting_name_input"
  end

  response :response_verify_success do |input|
    "注册成功"
  end

  response :response_no_name_input do |input|
    "输入姓名"
  end
end