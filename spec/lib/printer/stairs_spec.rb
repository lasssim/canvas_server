module Printer

  describe Stairs, :wip do
    let(:canvas) { Canvas::Stairs.new }
    let(:logger) { Logger.new(nil) }
    subject { described_class.new(canvas: canvas, logger: logger, opts: nil) }

    class FakeWs
      def initialize(num, pin, brightness = 50, options = {})
      end

      def []=(index, color)
      end

      def show
      end

      def set(nr, r, g, b)
      end

      def count
        1
      end

      def open
      end
    end

    before do
      allow(subject).to receive(:ws_class).and_return(FakeWs)
    end

    it "doesn't raise an error when #show is called" do
      expect { subject.show }.to_not raise_error
    end
  end

end
