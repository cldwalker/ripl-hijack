require 'ripl'
require 'hijack'

class Hijack::Console
  class <<self; attr_accessor :remote; end

  # Disable irb and make @remote accessible
  def start_irb
    self.class.remote = @remote
  end
end

module Ripl::Hijack
  VERSION = '0.1.0'

  def before_loop
    Hijack.start(config[:hijack_pid], config[:hijack_options])
    @binding = loop_eval("self").instance_eval { binding }
    super
  end

  def after_loop
   Hijack::Console.remote.evaluate('__hijack_exit') rescue nil
  end

  def loop_eval(str)
    (helper = Hijack::Helper.find_helper(str)) ?
      Hijack::Helper.send(helper, Hijack::Console.remote) :
      Hijack::Console.remote.evaluate(str)
  end
end

Ripl::Shell.send :include, Ripl::Hijack
