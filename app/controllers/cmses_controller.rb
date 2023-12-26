# app/controllers/cmses_controller.rb
class CmsesController < ApplicationController
  before_action :set_cms, only: %i[show edit update destroy]

  def index
    @cmses = Cms.all
  end

  def show
  end

  def new
    @cms = Cms.new
  end

  def create
    @cms = Cms.new(cms_params)

    if @cms.save
      redirect_to @cms, notice: 'Cms was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cms.update(cms_params)
      redirect_to @cms, notice: 'Cms was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cms.destroy
    redirect_to cmses_url, notice: 'Cms was successfully destroyed.'
  end

  private

  def set_cms
    @cms = Cms.find(params[:id])
  end

  def cms_params
    params.require(:cms).permit(:PageName, :Language, :Location, :Type, :Value, :Last_modified_date)
  end
end
