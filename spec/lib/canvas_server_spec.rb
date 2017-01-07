require 'spec_helper' 

describe CanvasServer do
  
  class TestPrinter < Printer::Base
    def show
      canvas
    end
  end

  around do |ex|
    Celluloid.boot
    ex.run
    Celluloid.shutdown
  end

  let(:host) { "localhost" }
  let(:port) { 3030 }
  let(:canvas) { Canvas::Rectangle.new(opts: { width: 2, height: 3 }) }
  let(:printer) { TestPrinter.new(canvas: canvas) }

  subject do 
    described_class.new(
      host:    host, 
      port:    port, 
      printer: printer
    ) 
  end
  
  before { subject.start }
  after  { subject.stop }


  let(:test_socket)        { TCPSocket.new(host, port) }
  let(:white)              { Canvas::Pixel.new([255, 255, 255]) }
  let(:black)              { Canvas::Pixel.new([0, 0, 0]) }
  let(:client_side_canvas) { Canvas::Rectangle.new(opts: { width: 2, height: 3, default_pixel: white }) }
 
  def send(message)
    test_socket.puts message
    test_socket.close_write
    sleep(0.1)
  end

  it "updates the canvas" do
    send(client_side_canvas.serialize)
    expect(canvas).to eq(client_side_canvas)
  end

  it "calls show of the printer" do
    expect(printer).to receive(:show).once
    send(client_side_canvas.serialize)
  end

end
