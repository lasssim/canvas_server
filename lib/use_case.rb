require_relative 'use_case/start_server'

module UseCase
  module_function

  def configure(hash={}, &block)
    @config = Confstruct::Configuration.new(hash, &block)
  end

  def config
    @config || configure
  end

end
