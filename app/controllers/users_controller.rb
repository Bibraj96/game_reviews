class UsersController < ApplicationController

  # renders login form
  get '/login' do
    erb :login
  end

  # receive the login form, find the user, log the user in by creating a session
  post '/login' do

  end

  get '/signup' do

  end

end