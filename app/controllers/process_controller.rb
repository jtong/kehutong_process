
class ProcessController < ApplicationController
  include SubscribeStateRouters

  def handle
    response_text = KehutongProcessBizLogicRouter.router.handle(params[:input])
    render :text => response_text
  end
end
