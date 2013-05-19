# coding: utf-8
class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.order("created_at DESC")
  end

  def make_admin
    User.find(params[:id]).admin!
    redirect_to users_path, notice: "Пользователь сделан администатором"
  end

  def make_user
    User.find(params[:id]).user!
    redirect_to users_path, notice: "Установлена роль пользователя"
  end

  def make_tutor
    User.find(params[:id]).tutor!
    redirect_to users_path, notice: "Установлена роль преподавателя"
  end

  def destroy
    User.find(params[:id]).delete
    redirect_to users_path, notice: "Пользователь удален"
  end

end
