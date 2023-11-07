class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all
        @tweet = Tweet.new
    end
    
    def create
        tweet_message = params[:message]
        tweet = current_user.tweets.new(message: tweet_message)
        if tweet.save
            puts "ツイート保存成功"
            redirect_to root_path
        else
            puts "ツイート保存失敗: #{tweet.errors.full_messages.join(", ")}"
            render "new"
        end
    end
    
    def destroy
        delete_tweet = Tweet.find(params[:id])
        delete_tweet.destroy
        redirect_to root_path
    end

end
