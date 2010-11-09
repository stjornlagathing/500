class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:rpx]

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
    
  def rpx
    rpx = Rpx::RpxHelper.new(JANRAIN_API, "https://frambjodendur.rpxnow.com/", "www.frambjodendur.is")
    profile = rpx.auth_info(params[:token])
    unless @user = User.find_by_identifier(profile['identifier'])
      @user = User.create!(:email => profile['email'], :identifier => profile['identifier'], :name => profile['displayName'])
    end
    session[:user_id] = @user.id
    redirect_to root_path
  end
end
