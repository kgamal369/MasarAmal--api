# frozen_string_literal: true
# app/controllers/cms_section_components_controller.rb

class CmsSectionComponentsController < ApplicationController
  before_action :set_section_component, only: %i[show edit update destroy]

  # GET /section_components or /section_components.json
  def index
    @section_components = CmsSectionComponent.all
  end

  # GET /section_components/1 or /section_components/1.json
  def show; end

  # GET /section_components/new
  def new
    @section_component = CmsSectionComponent.new
  end

  # GET /section_components/1/edit
  def edit; end

  # POST /section_components or /section_components.json
  def create
    @section_component = CmsSectionComponent.new(section_component_params)

    respond_to do |format|
      if @section_component.save
        format.html do
          redirect_to section_component_url(@section_component), notice: 'Section component was successfully created.'
        end
        format.json { render :show, status: :created, location: @section_component }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @section_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /section_components/1 or /section_components/1.json
  def update
    respond_to do |format|
      if @section_component.update(section_component_params)
        format.html do
          redirect_to section_component_url(@section_component), notice: 'Section component was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @section_component }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @section_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /section_components/1 or /section_components/1.json
  def destroy
    @section_component.destroy!

    respond_to do |format|
      format.html { redirect_to section_components_url, notice: 'Section component was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_section_component
    @section_component = CmsSectionComponent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def section_component_params
    params.require(:cms_section_component).permit(:sectionid, :componentid)
  end
end
