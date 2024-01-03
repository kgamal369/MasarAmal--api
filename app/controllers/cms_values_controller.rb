class CmsValuesController < ApplicationController
  before_action :set_cms_value, only: %i[show edit update destroy]

  # Standard CRUD Actions
  def index
    @cms_values = CmsValue.all
    # render index view
  end

  def show
    # render show view
  end

  def new
    @cms_value = CmsValue.new
    # render new view
  end

  def edit
    # render edit view
  end

  def create
    @cms_value = CmsValue.new(cms_value_params)
    # save and redirect or render new
  end

  def update
    cms_value = CmsValue.find(params[:id])
    if cms_value.update(cms_value_params)
      render json: { status: 'success', message: 'Value updated' }
    else
      render json: { status: 'error', message: 'Update failed' }, status: :unprocessable_entity
    end
  end

  def destroy
    @cms_value.destroy
    # redirect to index
  end

  # Custom Actions for Specific Conditions
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
    params.require(:cms_value).permit(:value)
  end
end
