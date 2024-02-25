# //app/controllers/cms_values_controller.rb
class CmsValuesController < ApplicationController
  before_action :set_cms_value, only: [:show, :edit, :update, :destroy]

  def index
    @cms_values = CmsValue.includes(:cms_page_section, :cms_section_component, :cms_language)
                          .select('cms_values.id, cms_values.value, cms_pages.pagename as cms_page_pagename, cms_sections.sectionname as cms_section_sectionname, cms_components.componentname as cms_component_componentname, cms_languages.language_name as cms_language_languagename')
                          .joins('JOIN cms_page_sections ON cms_values.pagesectionid = cms_page_sections.id')
                          .joins('JOIN cms_pages ON cms_page_sections.pageid = cms_pages.id')
                          .joins('JOIN cms_section_components ON cms_values.sectioncomponentid = cms_section_components.id')
                          .joins('JOIN cms_sections ON cms_section_components.sectionid = cms_sections.id')
                          .joins('JOIN cms_components ON cms_section_components.componentid = cms_components.id')
                          .joins('JOIN cms_languages ON cms_values.languageid = cms_languages.id')
  end

  def show
  end

  def new
    @cms_value = CmsValue.new
  end

  def edit
  end

  def create
    @cms_value = CmsValue.new(cms_value_params)
    if @cms_value.save
      redirect_to @cms_value, notice: 'Cms value was successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @cms_value.update(cms_value_params)
        format.html {  redirect_to @cms_value, notice: 'Cms value was successfully updated.'}
        format.json { render :show, status: :ok, location: @cms_value }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cms_value.errors, status: :unprocessable_entity }
      end
    end  
  end

  def destroy
    @cms_value.destroy

    respond_to do |format|
      format.html {redirect_to cms_values_url, notice: 'Cms value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end 

  private
    def set_cms_value
      @cms_value = CmsValue.find(params[:id])
    end

    def cms_value_params
      params.require(:cms_value).permit(:pagesectionid, :sectioncomponentid, :languageid, :value)
    end
end

