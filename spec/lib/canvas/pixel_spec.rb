module Canvas
  describe Pixel do

    subject { Pixel.new(rgb) }

    context "array" do
      let(:rgb) { [1, 2, 3] }
      its(:to_a) { is_expected.to eq(rgb) }
    end

  end
end
