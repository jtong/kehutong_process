require "spec_helper"
@@current = "subscribe"
@@test_input_verify_code_matcher = false


describe KehutongProcessBizLogicRouter do

  describe "state" do
    it "can realize what i can handle" do
      input_verify_code_matcher = Matcher.new :input_verify_code_matcher do |input|
        @@test_input_verify_code_matcher == true;
        :then
      end

      verify_code_handler = Handler.new :verify_code_handler do |input|
        puts "I am handle code";
      end

      change_state_to_member_service_handler = Handler.new :change_state_to_member_service_handler do|input|
        @@current = "member_service"
      end

      response_verify_success = Response.new :response_verify_success do |input|
        "注册成功"
      end

      KehutongProcessBizLogicRouter.router.draw do
        state :subscribe, :matcher => input_verify_code_matcher

        input_verify_code_matcher.on :then => verify_code_handler

        verify_code_handler.on :then => change_state_to_member_service_handler

        change_state_to_member_service_handler.on :then => response_verify_success
      end

      responses_object = KehutongProcessBizLogicRouter.router.handle  input:"1234"
      expect(responses_object).to eq("注册成功")
      expect(@@current).to eq("member_service")
    end

  end

  it "can realize what i can matcher2" do
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

    KehutongProcessBizLogicRouter.router.draw do
      state :subscribe, :matcher => input_verify_code_matcher

      input_verify_code_matcher.on :then => verify_code_handler

      verify_code_handler.on :then => no_name_matcher

      no_name_matcher.on :then => change_state_to_waiting_name_input_handler,
                         :otherwise => change_state_to_member_service_handler

      change_state_to_waiting_name_input_handler.on :then => response_no_name_input
      change_state_to_member_service_handler.on :then => response_verify_success
    end

    responses_object = KehutongProcessBizLogicRouter.router.handle  input:"1234"
    expect(responses_object).to eq("输入姓名")
    expect(@@current).to eq("waiting_name_input")
  end
  #state 应该用做两部分
  # 一部分是函数定义作用域,一部分是函数链接描述
end