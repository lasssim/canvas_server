require_relative 'printer/base'
require_relative 'printer/stairs'

if ENV["APP_ENV"] == "development"
  require_relative 'printer/sdl'
end

module Printer

end
