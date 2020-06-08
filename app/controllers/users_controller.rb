class UsersController < ApplicationController

  get '/signup' do
    erb :signup
  end

  post '/users' do
    @user = User.create(params)
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "You have successfully created a Game Reviews account!"
      redirect "/users/#{@user.id}"
    else
      flash[:errors] = "Account creation incomplete: #{@user.errors.full_messages.to_sentence}!"
      redirect '/signup'
    end
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "users/#{@user.id}"
    else
      flash[:errors] = "Invalid credentials. Please enter a valid email and password!"
      redirect '/login'
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