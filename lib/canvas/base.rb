module Canvas

  class Base
    attr_reader :default_pixel
    
    def initialize(opts:{})
      @default_pixel = opts.fetch(:default_pixel) { Pixel.new([0, 0, 0]) }
    end

    def pixels=(new_pixels)
      valid_new_pixels = new_pixels.select { |k| pixels.has_key? k }
      self.pixels.merge!(valid_new_pixels)
    end

    def pixels
      raise NotImplementedError
    end

    def set_pixel(x, y, pixel)
      self.pixels = { [x, y] => pixel }
    end

    # TODO: extract serialize and deserialize to separate classes
    def serialize
      serializable_hash = pixels.merge(pixels) do |_, v|
        v.to_a
      end
  
      MessagePack.pack(serializable_hash)
    end
  
    def deserialize(hash)
      self.pixels = hash.merge(hash) do |_, v|
        Pixel.new(v)
      end
    end
  
    def ==(other)
      pixels == other.pixels
    end
 
  end
end
