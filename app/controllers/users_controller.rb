class UsersController < ApplicationController

  #renders login form
  get '/login' do
    erb :login
  end

  get '/signup' do

  end

end