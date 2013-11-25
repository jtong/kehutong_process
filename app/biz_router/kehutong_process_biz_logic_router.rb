# 状态 只有then
# response不连接
# handler只有then,handler改变状态,然后response
# matcher有then,otherwise,doubt
class KehutongProcessBizLogicRouter

  def initialize
    @states = States.all
  end

  def self.router
    @@router ||= KehutongProcessBizLogicRouter.new
  end

  def handle input
    return @states[0].handle input
  end

end

