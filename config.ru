# frozen_string_literal: true

require './app/app'

$stdout.sync = true

run Sinatra::Application
