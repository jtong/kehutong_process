class ProcessController < ApplicationController

  def handle
    #response_text = KehutongProcessRouter.router.handle(params[:input])
    render :text => "I am running"
  end
end
