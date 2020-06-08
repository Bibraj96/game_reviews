class ReviewsController < ApplicationController

  get '/reviews/new' do
    erb :'/reviews/new'
  end

  post '/reviews' do
    if !logged_in?
      redirect '/'
    end

    if params[:content] != "" && params[:game] != ""
      @review = Review.create(content: params[:content], game: params[:game], user_id: current_user.id)
      flash[:message] = "You created a review!"
      redirect "/reviews/#{@review.id}"
    else
      flash[:errors] = "Unable to create a review. Please make sure all fields are filled out"
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

  patch '/reviews/:id' do
    @review = Review.find(params[:id])
    if logged_in?
      @review.update(game: params[:game], content: params[:content])
      if @review.save
        flash[:message] = "Review edited!"
        redirect "/reviews/#{@review.id}"
      else
        flash[:errors] = "Unable to edit this review: #{@review.errors.full_messages.to_sentence}"
        redirect "reviews/#{@review.id}/edit"
      end
    else
      redirect '/'
    end
  end

  delete '/reviews/:id' do
    @review = Review.find(params[:id])
    if current_user == @review.user
      @review.destroy
      flash[:message] = "Review deleted!"
      redirect '/reviews'
    else
      redirect '/reviews'
    end
  end

end