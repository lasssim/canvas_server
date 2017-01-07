module Printer
  describe Base do
    subject { described_class.new(canvas: canvas, logger: nil) }

    let(:canvas) { double }

    it "raises an error when pixels is not implemented" do
      expect { 
        subject.show
      }.to raise_exception(NotImplementedError)
    end
  end
end
