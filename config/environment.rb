require 'rubygems'
require 'bundler'
env = ENV['APP_ENV'] || :development
Bundler.setup(:default, env)
Bundler.require

$:.unshift(File.expand_path('../../lib', __FILE__))

require 'logger'

require 'canvas_server'
require 'canvas'
require 'printer'
require 'use_case'

require ::File.expand_path("../environments/#{env}",  __FILE__)
