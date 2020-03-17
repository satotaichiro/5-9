class UsersController < ApplicationController
  def show
  end

  def index
  	@users = User.all
  	@user = User.new
  end

  def edit
  end
end
