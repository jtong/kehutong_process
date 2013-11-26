require 'subscribe_state'

class States

  def self.all
    @@states ||= self.init
  end

  def self.init
    State.descendants().map{|a_class| a_class.new}
  end
end