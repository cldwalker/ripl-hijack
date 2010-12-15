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
  def before_loop
    super
    add_commands loop_eval("self")
  end

  def loop_eval(str)
    Hijack::Console.remote.evaluate(str)
  end

  module Commands
    Hijack::Helper.methods.grep(/^hijack_/) do |meth|
      define_method(meth) do
        Hijack::Helper.send(meth, Hijack::Console.remote)
      end
    end
  end
end

Ripl::Shell.send :include, Ripl::Hijack
Ripl::Commands.send :include, Ripl::Hijack::Commands
p Ripl::Commands.instance_methods
