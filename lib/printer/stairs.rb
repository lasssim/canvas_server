module Printer
  class Stairs < Base
 
    def show
      canvas.pixels.each do |(x, y), pixel|
        ws[x][y] = pixel_to_color(pixel)
      end
      ws_show
    end

    def startup_animation
      100.times do 
        sparkle(255, 255, 255)
      end
    end


    private

    def ws_class 
      Ws2812::Basic
    end

    def ws
      @ws ||= begin
        [
          ws_class.new(109, 18, brightness, channel: 0),
          ws_class.new( 98, 19, brightness, channel: 1)
        ]
      end
    end

    def ws_show
      ws.each(&:show)
    end

    def pixel_to_color(pixel)
      Ws2812::Color.new(*pixel.to_a)
    end

    def brightness
      10
    end

    def sparkle(r, g, b)
      ws.each do |w|
        led_nr = rand(w.count)
        w.set(led_nr, r, g, b)
        sleep(0.001)
        w.set(0, 0, 0)
      end
    end
  end
end
