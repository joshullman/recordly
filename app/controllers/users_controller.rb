class UsersController < ApplicationController

  def show
    if !params[:id]
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end


  private
    def user_params
      params.fetch(:user, {})
    end
end
