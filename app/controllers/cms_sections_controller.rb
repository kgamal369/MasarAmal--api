# frozen_string_literal: true

class CmsSectionsController < ApplicationController
  before_action :set_section, only: %i[show edit update destroy]

  # GET /sections or /sections.json
  def index
    @sections = CmsSection.all
  end

  # GET /sections/1 or /sections/1.json
  def show; end

  # GET /sections/new
  def new
    @section = CmsSection.new
  end

  # GET /sections/1/edit
  def edit; end

  # POST /sections or /sections.json
  def create
    @section = CmsSection.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to section_url(@section), notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1 or /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to section_url(@section), notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1 or /sections/1.json
  def destroy
    @section.destroy!

    respond_to do |format|
      format.html { redirect_to sections_url, notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_section
    @section = CmsSection.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def section_params
    params.require(:section).permit(:Components, :Languages, :PageSection, :SectionComponent, :CMSValue)
  end
end
