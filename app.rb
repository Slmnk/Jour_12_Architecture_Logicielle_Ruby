require 'bundler'
Bundler.require

require 'open-uri'

$:.unshift File.expand_path("./lib/app/", __FILE__)
require 'google.rb'
