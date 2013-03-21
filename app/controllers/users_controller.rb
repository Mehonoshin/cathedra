# coding: utf-8
class UsersController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def make_admin
    User.find(params[:id]).admin!
    redirect_to users_path, notice: "Пользователь сделан администатором"
  end

  def make_user
    User.find(params[:id]).user!
    redirect_to users_path, notice: "Пользователь удален из администаторов"
  end

end
