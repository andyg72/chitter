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

  SIGNED_IN_ROUTES = ['/peeps/compose_peep', '/peeps/compose_reply']

  before do
    if request.path != '/'
      requested_url = "/#{request.path.to_s.split('/')[1,2].join('/')}"
      if !current_user && SIGNED_IN_ROUTES.include?(requested_url)
        flash[:notice] = "You must be signed in first"
        redirect '/sessions/sign_in'
      end
    end
  end

  get '/' do
    @last_ten_peeps = Peep.all(limit:10, order: [:peep_timestamp.desc])
    erb :index
  end

  delete '/sessions/sign_out' do
    session.clear
    flash[:notice] = "Goodbye, see you again soon!"
    redirect to('/')
  end

  get '/sessions/sign_up' do
    erb :sign_up
  end

  post '/sessions/sign_up' do
    @user = User.create(email: params[:email], name: params[:name],
      username: params[:username], password: params[:password],
      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash[:errors] = @user.errors.full_messages
      redirect to('/sessions/sign_up')
    end
  end

  get '/sessions/sign_in' do
    erb :sign_in
  end

  post '/sessions/sign_in' do
    email, password = params[:email], params[:password]
    @user = User.authenticate(email, password)
    if @user
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash[:errors] = ['Failed to log in with those details, please try again']
      redirect to('/sessions/sign_in')
    end
  end

  get '/peeps/compose_peep' do
    @user_id = session[:user_id]
    erb :compose_peep
  end

  post '/peeps/post_peep' do
    @peep = Peep.create(user_id: params[:user_id], peep_text: params[:peep_text], peep_timestamp: Time.now)
    if @peep.save
      redirect to('/')
    else
      flash[:errors] = @peep.errors.full_messages
      redirect to('/peeps/compose_peep')
    end
  end

  get '/peeps/compose_reply/:peep_id' do
    @peep_id = params[:peep_id]
    @user_id = session[:user_id]
    erb :compose_reply
  end

  post '/peeps/post_reply' do
    @reply = Reply.create(reply_text: params[:reply_text], reply_timestamp: Time.now, 
      user_id: params[:user_id], peep_id: params[:peep_id])
    if @reply.save
      redirect to('/')
    else
      flash[:errors] = @reply.errors.full_messages
      redirect to("/peeps/compose_reply/#{params[:pee]}")
    end
  end


end