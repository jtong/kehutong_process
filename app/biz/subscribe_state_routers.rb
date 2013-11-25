module SubscribeStateRouters
  include SubscribeStateDescription
  #def self.define_subscribe
    KehutongProcessBizLogicRouter.router.draw do

      state :subscribe, :matcher => input_verify_code_matcher

      input_verify_code_matcher.on :then => verify_code_handler

      verify_code_handler.on :then => no_name_matcher

      no_name_matcher.on :then => change_state_to_waiting_name_input_handler,
                         :otherwise => change_state_to_member_service_handler

      change_state_to_waiting_name_input_handler.on :then => response_no_name_input
      change_state_to_member_service_handler.on :then => response_verify_success
    end
  #end


end