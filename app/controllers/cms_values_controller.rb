# //app/controllers/cms_values_controller.rb
class CmsValuesController < ApplicationController
  before_action :set_cms_value, only: %i[show edit update destroy]

  def index
    @cms_values = CmsValue.includes(:cms_page_section, :cms_section_component, :cms_language)
                         .select('cms_values.id, cms_values.value, cms_pages.page_name as cms_page_pagename, cms_sections.section_name as cms_section_sectionname, cms_components.component_name as cms_component_componentname, cms_languages.language_name as cms_language_languagename')
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
    if cms_value.save
      render json: cms_value, status: :created
      redirect_to some_path, notice: 'CMS value was successfully created.'
    else
      render json: cms_value.errors, status: :unprocessable_entity
    end
  end

  def update
    cms_value = CmsValue.find(params[:id])
    if cms_value.update(cms_value_params)
      render json: { status: 'success', message: 'Value updated' }
      redirect_to admin_cms_value_path(cms_value), notice: 'Value updated successfully.'

    else
      Rails.logger.error "Failed to update CmsValue: #{cms_value.errors.full_messages.join(', ')}"
      render json: { status: 'error', message: 'Update failed' }, status: :unprocessable_entity
      render 'edit'
    end
  end

  def destroy
    @cms_value.destroy
  end
  
  def filter
    query = CmsValue.joins(:cms_section_component, :cms_language)
    query = query.where(languageid: params[:languageid]) if params[:languageid].present?
    query = query.where(pagesectionid: params[:pagesectionid]) if params[:pagesectionid].present?
  
    cms_values = query.select('cms_values.value, cms_components.componentname')
                      .map do |v|
                        { component_name: v.cms_section_component.cms_component.componentname, value: v.value }
                      end
  
    render json: cms_values
  end
  
 

  def filter_by_language
    language = params[:language]
    @cms_values = CmsValue.joins(:cms_language).where(cms_languages: { language_name: language })
    render json: @cms_values
  end

  def filter_by_page
    page_name = params[:page_name]
    filter_values_by_page(page_name)
  end

  def filter_by_page_and_language
    page_name = params[:page_name]
    language = params[:language]
    cms_values = CmsValue.joins(cms_page_section: [:cms_page])
                         .joins(cms_section_component: %i[cms_section cms_component])
                         .joins(:cms_language)
                         .where(cms_pages: { pagename: page_name }, cms_languages: { languagename: language })
                         .select('cms_values.*', 'cms_sections.sectionname', 'cms_components.componentname')
    grouped_data = cms_values.group_by { |v| v.cms_section_component.cms_section.sectionname }
                             .transform_values do |section_values|
                               section_values.group_by { |v| v.cms_section_component.cms_component.componentname }
                                             .transform_values do |component_values|
                                               component_values.first.value
                                             end
                             end
    render json: grouped_data
  end  

  def filter_by_page_and_section
    page_name = params[:page_name]
    section_name = params[:section_name]
    @cms_values = CmsValue.joins(cms_page_section: [:cms_page, cms_section])
                          .where(cms_pages: { pagename: page_name },
                                 cms_sections: { section_name: })
    render json: @cms_values
  end

  def filter_by_page_section_and_language
    page_name = params[:page_name]
    section_name = params[:section_name]
    language = params[:language]
    @cms_values = CmsValue.joins(:cms_language, cms_page_section: %i[cms_page cms_section])
                          .where(cms_pages: { pagename: page_name },
                                 cms_sections: { sectionname: section_name },
                                 cms_languages: { languagename: language })
    render json: @cms_values
  end

  private

  def filter_values_by_page(page_name)
    @cms_values = CmsValue.joins(cms_page_section: :cms_page).where(cms_pages: { pagename: page_name })
    render json: @cms_values
  end

  def filter_values_by_page_and_language(page_name, language)
    @cms_values = CmsValue.joins(:cms_language, cms_page_section: :cms_page)
                          .where(cms_pages: { pagename: page_name },
                                 cms_languages: { languagename: language })
    render json: @cms_values
  end

  def cms_value_params
    params.require(:cms_value).permit(:pagesectionid, :sectioncomponentid, :languageid, :value)
  end
 
  def sections_for_page
    page_id = params[:page_id]
    sections = CmsSection.where(page_id: page_id).map { |s| { id: s.id, name: s.sectionname } }
    render json: sections
  end

  def components_for_section
    section_id = params[:section_id]
    components = CmsComponent.where(section_id: section_id).map { |c| { id: c.id, name: c.componentname } }
    render json: components
  end
end
