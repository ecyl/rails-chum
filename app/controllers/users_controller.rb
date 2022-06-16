class UsersController < ApplicationController
  def show
    @user = authorize User.find(params[:id])
    @static_navbar = true
  end
end
