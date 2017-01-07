module Printer
  class Base
    attr_reader :canvas, :logger
    def initialize(canvas:, logger:, opts:{})
      @canvas = canvas
      @logger = logger
    end

    def show
      raise NotImplementedError
    end

  end
end
