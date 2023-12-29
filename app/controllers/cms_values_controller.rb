class CmsValuesController < ApplicationController
  before_action :set_cms_value, only: [:show, :edit, :update, :destroy]

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
    # update and redirect or render edit
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
      filter_values_by_page_and_language(page_name, language)
    end
    
    
    def filter_by_page_and_section
      page_name = params[:page_name]
      section_name = params[:section_name]
      @cms_values = CmsValue.joins(cms_page_section: [:cms_page, cms_section])
                            .where(cms_pages: { pagename: page_name }, 
                                   cms_sections: { section_name: section_name })
      render json: @cms_values
    end
  
    def filter_by_page_section_and_language
      page_name = params[:page_name]
      section_name = params[:section_name]
      language = params[:language]
      @cms_values = CmsValue.joins(:cms_language, cms_page_section: [:cms_page, :cms_section])
                            .where(cms_pages: { pagename: page_name }, 
                                   cms_sections: { sectionname: section_name },
                                   cms_languages: { languagename: language })
      render json: @cms_values
    end
       
    
    # def filter_by_page_section_and_component
    #   page_name = params[:page_name]
    #   section_name = params[:section_name]
    #   component_name = params[:component_name]
    #   @cms_values = CmsValue.joins(cms_page_section: [:cms_page, cms_section], cms_section_component: :cms_component)
    #                         .where(cms_pages: { pagename: page_name }, 
    #                                cms_sections: { section_name: section_name },
    #                                cms_components: { component_name: component_name })
    #   render json: @cms_values
    # end
  
    # def filter_by_page_section_component_and_language
    #   page_name = params[:page_name]
    #   section_name = params[:section_name]
    #   component_name = params[:component_name]
    #   language = params[:language]
    #   @cms_values = CmsValue.joins(cms_page_section: [:cms_page, { cms_section: :cms_language }], cms_section_component: :cms_component)
    #                         .where(cms_pages: { pagename: page_name }, 
    #                                cms_sections: { section_name: section_name },
    #                                cms_components: { component_name: component_name },
    #                                cms_languages: { languagename: language })
    #   render json: @cms_values
    # end
        
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
        

  end
