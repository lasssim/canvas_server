module Canvas
  describe Rectangle do

    let(:width) { 2 }
    let(:height) { 3 }

    subject do
      described_class.new(
        opts: {
          width: width,
          height: height
        }
      )
    end

    context "default canvas" do
      it "has the correct width" do
        calculated_width = subject.pixels.keys.map { |(x, y)| x }.uniq.size
        expect(calculated_width).to eq(width)
      end

      it "has the correct height" do
        calculated_height = subject.pixels.keys.map { |(x, y)| y }.uniq.size
        expect(calculated_height).to eq(height)
      end

      it "has the correct color" do
        pixels = subject.pixels.values
        expected_pixles = (width*height).times.map { Pixel.new([0, 0, 0]) }
        expect(pixels).to eq(expected_pixles)
      end
    end


    context "serialize/deserialize" do
      let(:other_canvas) do
        described_class.new(
          opts: {
            width: width,
            height: height,
            default_pixel: Pixel.new([123, 123, 123])
          }
        )
      end


      it "changes the canvas" do
        pixels = other_canvas.pixels
        message = pixels.merge(pixels) do |_, v|
          v.to_a
        end
        subject.deserialize(message)

        expect(subject).to eq other_canvas
      end
    end



  end

end
