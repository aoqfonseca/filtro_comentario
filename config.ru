require 'rubygems'
require 'bundler'

Bundler.require
require "./filter_poc"

run Sinatra::Application
