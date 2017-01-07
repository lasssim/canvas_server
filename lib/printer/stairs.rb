module Printer
  class Stairs
  
    def show
      canvas.pixels.each do |(x, y), pixel|
        ws[x][y] = pixel_to_color(pixel)
      end
    end

    private

    def ws
      @ws ||= begin
        [
          Ws2812::Basic.new(109, 18, brightness, channel: 0),
          Ws2812::Basic.new( 98, 19, brightness, channel: 1)
        ]
      end
    end

    def pixel_to_color(pixel)
      Ws2812::Color.new(*pixel.to_a)
    end

    def brightness
      10
    end
  end
end
