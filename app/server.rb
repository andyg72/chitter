require 'data_mapper'
require 'sinatra'
require 'rack-flash'
require_relative './data_mapper_setup'
require_relative './helpers/application_helper'

class Chitter < Sinatra::Base

  helpers ApplicationHelpers

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/registration' do
    @user = User.create(email: params[:email], name: params[:name],
      username: params[:username], password: params[:password],
      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
    end
  end


end