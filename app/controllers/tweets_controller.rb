class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all
        render
    end
    
    def new
        @tweet = Tweet.new
    end
    
    def create
        user_id = params[:user_id]
        tweet_message = params[:message]
        tweet = Tweet.new(user_id: user_id, message: tweet_message)
        if tweet.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    def destroy
        delete_tweet = Tweet.find(params[:id])
        delete_tweet.destroy
        redirect_to root_path
    end

end
