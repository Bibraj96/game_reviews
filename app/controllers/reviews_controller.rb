class ReviewsController < ApplicationController

  # get reviews/new to render a form to create a new review
  get '/reviews/new' do
    erb :'/reviews/new'
  end

    # create new reveiw and save it to the DB
    # only save if it has content
    # only create a review if the user is logged in
  post '/reviews' do
    if !logged_in?
      redirect '/'
    end

    if params[:content] != "" && params[:game] != ""
      @review = Review.create(content: params[:content], game: params[:game], user_id: current_user.id)
      redirect "/reviews/#{@review.id}"
    else
      redirect '/reviews/new'
    end
  end

  get '/reviews' do
    @reviews = Review.all
    erb :'/reviews/index'
  end

  get '/reviews/:id' do
    @review = Review.find(params[:id])
    erb :'/reviews/show'
  end

  # this sends us to '/reviews/edit.erb'
  get '/reviews/:id/edit' do
    @review = Review.find(params[:id])
    if logged_in?
      if @review.user == current_user
       erb :'/reviews/edit'
      else
        redirect "users/#{current_user.id}"
      end
    else
      redirect '/'
    end
  end

  # find review, edit review, redirect to show page
  patch '/reviews/:id' do
    @review = Review.find(params[:id])
    if logged_in?
      if @review.user == current_user
        @review.update(game: params[:game], content: params[:content])
        redirect "/reviews/#{@review.id}"
      else
        redirect "users/#{current_user.id}"
      end
    else
      redirect '/'
    end
  end

  delete '/reviews/:id' do
    @review = Review.find(params[:id])
    if current_user == @review.user
      @review.destroy
      
    else

    end
  end

  # post reviews to create new review

  # show route for review

  # index page for all reviews

end