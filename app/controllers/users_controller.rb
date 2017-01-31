class UsersController < ApplicationController
  # GET /users/1
  # GET /users/1.json
  def show
    if !params[:id]
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end

  # GET /users/new

  # GET /users/1/edit
  def edit
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end
end
