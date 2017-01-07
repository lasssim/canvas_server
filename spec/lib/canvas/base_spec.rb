module Canvas
  describe Base do
    subject { described_class.new }

    it "raises an error when pixels is not implemented" do
      expect { 
        subject.pixels
      }.to raise_exception(NotImplementedError)
    end
  end
end
