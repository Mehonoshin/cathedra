# coding: utf-8
class ArticlesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def create
    @article = Article.create(params[:article])
    if @article.valid?
      redirect_to news_path, notice: "Новость успешно создана"
    else
      render "new"
    end
  end

  def update
    @article.update_attributes(params[:article])
    redirect_to articles_path, notice: "Новость успешно обновлена"
  end

  def edit
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "Новость удаленo"
  end

  def new
  end
end
