module Canvas
  class Stairs < Base
    def pixels
      @pixels ||= begin
        Hash[pixel_coordinates.map { |pc| [pc, default_pixel] }]
      end
    end

    private
    def pixel_coordinates
      coordinates = []

      109.times do |i|
        coordinates << [0, i]
      end

      98.times do |i|
        coordinates << [1, i]
      end

      coordinates
    end
  end
end
