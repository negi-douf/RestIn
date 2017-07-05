class TweetsController < ApplicationController
  
  def index
    
    # 一覧表示用
    @tweets = Tweet.all
    
    # form_for用
    # 一覧と同じ画面で投稿も実現したいから
    # この時点では保存しない
    # ムダに作ってる感じがするので、
    # もっといい方法が見つかれば改善したい
    @tweet = Tweet.new()
    
  end
  
  
  def create
    
    # form_for で取得した内容から作成
    @tweet = Tweet.new(tweets_params)
    
    if @tweet.save
      # flash message
      redirect_to root_path
    else
      # flash message
    end
    
  end
  
  
  def edit
    
  end
  
  
  def destroy
    
  end
  
  
  
  
  #######
  private
  #######
  
  # strong parameter
  # tweet に関するパラメータのみを許可し保持する
  # 使用は必須
  def tweets_params
    params.require(:tweet).permit(:content)
  end
  
  
  
end
