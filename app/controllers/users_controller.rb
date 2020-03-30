class UsersController < ApplicationController
  def show
    #@nickname = current_user.nickname
    #@tweets = current_user.tweets
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")
  end
end
