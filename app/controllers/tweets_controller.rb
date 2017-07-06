class TweetsController < ApplicationController
  
  def index
    
    # 一覧表示用
    @tweets = Tweet.all.sort.reverse
    
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
      flash[:success] = "ツイートを投稿しました！"
      redirect_to root_path
    else
      flash[:danger] = "ツイートの投稿に失敗しました"
      redirect_to root_path
    end
    
  end
  
  
  def edit
    # id を使って対象を特定
    # 取得するパラメータが一つの場合は
    # ストロングパラメータはいらない
    @tweet = Tweet.find_by(id: params[:id])
  end
  
  
  def update
    @tweet = Tweet.find_by(id: params[:id])
    
    if @tweet.update(tweets_params)
      flash[:success] = "ツイートを編集しました！"
      redirect_to root_path
    else
      flash[:danger] = "ツイートの編集に失敗しました"
      redirect_to edit_tweet_path
    end
    
  end
  
  
  def destroy
    @tweet = Tweet.find_by(id: params[:id])
    
    if @tweet.destroy
      flash[:success] = "ツイートを削除しました！"
      redirect_to root_path
    else
      flash[:danger] = "ツイートの削除に失敗しました"
      redirect_to root_path
    end
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
