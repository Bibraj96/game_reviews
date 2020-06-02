class UsersController < ApplicationController

  # renders signup form
  get '/signup' do
    erb :signup
  end

  # create new user and persist that user to the DB
  # only persist users that have a name email and password using if statement
  post '/users' do
    if params[:name] != "" && params[:email] != "" && params[:password] != ""
      @user = User.create(params) # We can use mass assignment here because my params hash has key/value pairs that correlate to the attributes for the user
      # redirect to user show page (not erb) because we're not going to use the insance variable, we just need to go to the show page
      redirect "/users/#{@user.id}"
    else

    end
  end

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
    @user = User.find_by(id: params[:id])

    erb :'/users/show'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end