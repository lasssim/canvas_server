module UseCase

  class StartServer
    attr_reader :logger
    def initialize(logger: UseCase.config.logger)
      @logger = logger
    end

    def run
      canvas_server.start
      trap("INT") { exit }
      while true; sleep; end
    end

    private

    def canvas
      config.canvas_class.new(
        opts: config.canvas_opts
      )
    end

    def printer
      config.printer_class.new(
        canvas: canvas,
        logger: logger,
        opts: config.printer_opts
      )
    end

    def canvas_server
      CanvasServer.new(
        host: config.host,
        port: config.port,
        printer: printer,
        logger: logger
      )
    end

    def config
      UseCase.config
    end

  end
end
