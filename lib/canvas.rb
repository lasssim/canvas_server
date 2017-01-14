require_relative 'canvas/base'
require_relative 'canvas/rectangle'
require_relative 'canvas/stairs'

if ENV["APP_ENV"] == "development"
  require_relative 'canvas/sdl'
end

require_relative 'canvas/pixel'
module Canvas

end
