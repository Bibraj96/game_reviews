class UsersController < ApplicationController

  # renders login form
  get '/login' do
    erb :login
  end

  # receive the login form, find the user, log the user in by creating a session
  # find the user
  # authenticate the user(verify user is who they say they are)
  # log the user in (create session)
  # redirect to the user's show page
  post '/login' do
    @user = User.find_by(email: params[:email]) #Finds user
    if @user.authenticate(params[:password]) # Authenticate 
      session[:user_id] = @user.id # Log user in 
      redirect "users/#{@user.id}"
    else
    
      # tell the user they entered invalid credentials
      #redirect to the login page
    end
  end

  get '/users/:id' do
    "User show route"
  end

  get '/signup' do

  end

end