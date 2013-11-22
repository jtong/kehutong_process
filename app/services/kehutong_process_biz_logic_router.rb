# 状态 只有then
# response不连接
# handler只有then,handler改变状态,然后response
# matcher有then,otherwise,doubt
class KehutongProcessBizLogicRouter

  def initialize
    @states = []
  end
  def self.router
    return @@router ||= KehutongProcessBizLogicRouter.new
  end

  def draw &block
    @states =[]
    self.instance_eval &block
    #p @states
    @current_state = @states[0]
  end

  def state state, options
    state_new = State.new(state)
    @states << state_new
    state_new.matcher= options[:matcher]
  end

  def handle input
    return @current_state.handle input
  end

end

