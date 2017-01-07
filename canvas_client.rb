#!/usr/local/bin/ruby

require 'bundler/setup'

Bundler.require

require ::File.expand_path('../config/environment',  __FILE__)

class TcpPrint

  attr_reader :canvas

  def initialize(args={})
    @canvas = args.fetch(:canvas)
  end

	def socket
		@socket ||= TCPSocket.open("localhost", 3030)
	end

  def show
    socket.puts canvas.serialize
  end
end



canvas = Canvas::Rectangle.new(
  opts: {
    width:  2,
    height: 4
  }
)


printer = TcpPrint.new(canvas: canvas)

#100.times do 
#
#  r = 256
#  g = r-40;
#  b = 41;
#
#  canvas.height.times do |led|
#    flicker = rand(150)
#    r1 = r-flicker
#    g1 = g-flicker
#    b1 = b-flicker
#
#    g1=0 if(g1<0) 
#    r1=0 if(r1<0) 
#    b1=0 if(b1<0) 
#
#    canvas.set_pixel(1, led, Canvas::Pixel.new([r1, g1, b1]))
#
#  end
#
#  printer.show
#
#  sleep((rand(101)+50)/100)
#
#  print "."
#end


100.times do 
  canvas.set_pixel(rand(canvas.width), rand(canvas.height), Canvas::Pixel.new([rand(255), rand(255), rand(255)]))
  printer.show
  print "."
  sleep(1)
end

