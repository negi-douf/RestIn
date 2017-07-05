class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new()
  end
  
  
  def create
    @tweet = Tweet.new(tweets_params)
    
    if @tweet.save
      # flash message
      redirect_to root_path
    else
      # flash message
      
    end
    
  end
  
  
  
  
  
  
  
  #######
  private
  #######
  
  def tweets_params
    params.require(:tweet).permit(:content)
  end
  
  
  
end
