#!/usr/bin/env ruby

require 'gosu'

$LOAD_PATH.unshift File.expand_path("src/")
Dir['./src/*.rb'].each { |klass| require klass }

Version = '0.0.1'

window = GameWindow.new
window.show
