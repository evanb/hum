$LOAD_PATH << File.expand_path('../../lib', __FILE__)

ENV['RACK_ENV'] ||= 'development'

# Set up gems listed in the Gemfile.
require 'bundler/setup'
Bundler.require

# Load Stencil
require 'hum'
