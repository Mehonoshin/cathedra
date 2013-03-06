# coding: utf-8
class PagesController < ApplicationController
  load_and_authorize_resource

  def show
    @page = Page.find_by_permalink(params[:id])
  end

  def history
    authorize! :read, Page
    @page = Page.find_by_permalink("history")
    render :show
  end

  def staff
    authorize! :read, Page
    @page = Page.find_by_permalink("staff")
    render :show
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    @page.update_attributes(params[:page])
    redirect_to edit_page_path(@page), notice: "Успешно обновлено"
  end
end
