# coding: utf-8
class MaterialsController < ApplicationController
  load_and_authorize_resource

  def index
    @materials = []
    if params[:category].present? && params[:faculty]
      @materials = Material.where(category: params[:category], department: params[:faculty]).order("priority DESC")
    end
  end

  def new
  end

  def create
    @material = Material.new(params[:material])
    if @material.save
      redirect_to materials_path, notice: "Материал успешно создан"
    else
      render "new"
    end
  end

  def destroy
    Material.find(params[:id]).delete
    redirect_to materials_path, notice: "Maтериал удален"
  end

  def update
    @material = Material.find(params[:id])
    @material.update_attributes(params[:material])
    if @material.valid?
      redirect_to materials_path, notice: "Материал успешно обновлен"
    else
      render "edit"
    end
  end

  def edit
  end
end
