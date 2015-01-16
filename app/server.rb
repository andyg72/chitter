require 'data_mapper'
require 'sinatra'
require 'data_mapper_setup'
require 'rack-flash'

class Chitter < Sinatra::Base

  # helpers AnyHelpers

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride

  get '/' do
    'Hello World!'
  end


end