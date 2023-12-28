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
  # Arabic Language
  def all_for_arabic
    @cms_values = CmsValue.joins(:cms_language).where(cms_languages: { languagename: 'ar' })
    render :index
  end

  # English Language
  def all_for_english
    @cms_values = CmsValue.joins(:cms_language).where(cms_languages: { languagename: 'en' })
    render :index
  end

  # Page-specific APIs
  def all_for_home_page
    filter_values_by_page('HomePage')
  end

  def all_for_doctors_page
    filter_values_by_page('DoctorsPage')
  end

  def all_for_treatment_page
    filter_values_by_page('TreatmentPage')
  end

  def all_for_service_page
    filter_values_by_page('ServicePage')
  end

  # Page and Language-specific APIs
  def home_page_arabic
    filter_values_by_page_and_language('HomePage', 'ar')
  end

  def home_page_english
    filter_values_by_page_and_language('HomePage', 'en')
  end

  def doctors_page_arabic
    filter_values_by_page_and_language('DoctorsPage', 'ar')
  end

  def doctors_page_english
    filter_values_by_page_and_language('DoctorsPage', 'en')
  end

  def treatment_page_arabic
    filter_values_by_page_and_language('TreatmentPage', 'ar')
  end

  def treatment_page_english
    filter_values_by_page_and_language('TreatmentPage', 'en')
  end

  def service_page_arabic
    filter_values_by_page_and_language('ServicePage', 'ar')
  end

  def service_page_english
    filter_values_by_page_and_language('ServicePage', 'en')
  end

  # Additional methods for each section name for each linked page name
  def home_page_hero_section
    filter_values_by_page_and_section('HomePage', 'Hero')
  end

  def home_page_cards_section
    filter_values_by_page_and_section('HomePage', 'Cards')
  end

  def home_page_about_us_section
    filter_values_by_page_and_section('HomePage', 'AboutUs')
  end

  def home_page_services_section
    filter_values_by_page_and_section('HomePage', 'Services')
  end

  def doctors_page_hero_section
    filter_values_by_page_and_section('DoctorsPage', 'Hero')
  end

  def doctors_page_referral_criteria_section
    filter_values_by_page_and_section('DoctorsPage', 'Referral Criteria')
  end

  def doctors_page_login_section
    filter_values_by_page_and_section('DoctorsPage', 'Login')
  end

  def treatment_page_hero_section
    filter_values_by_page_and_section('TreatmentPage', 'Hero')
  end

  def treatment_page_doctors_section
    filter_values_by_page_and_section('TreatmentPage', 'Doctors')
  end

  def treatment_page_approach_section
    filter_values_by_page_and_section('TreatmentPage', 'Approach')
  end

  def treatment_page_plans_section
    filter_values_by_page_and_section('TreatmentPage', 'Plans')
  end

  def service_page_hero_section
    filter_values_by_page_and_section('ServicePage', 'Hero')
  end

  def service_page_cards_section
    filter_values_by_page_and_section('ServicePage', 'Cards')
  end

  def service_page_services_section
    filter_values_by_page_and_section('ServicePage', 'Services')
  end

  # Additional methods for each section name for each linked page name for each language
  def home_page_hero_section_arabic
    filter_values_by_page_section_and_language('HomePage', 'Hero', 'ar')
  end

  def home_page_hero_section_english
    filter_values_by_page_section_and_language('HomePage', 'Hero', 'en')
  end

  # ... Additional methods for other combinations ...

  private

    def set_cms_value
      @cms_value = CmsValue.find(params[:id])
    end

    def cms_value_params
      params.require(:cms_value).permit(:value, :cms_page_section_id, :cms_section_component_id, :cms_language_id)
    end

    def filter_values_by_page(page_name)
      @cms_values = CmsValue.joins(cms_page_section: :cms_page).where(cms_pages: { pagename: page_name })
      render :index
    end

    def filter_values_by_page_and_language(page_name, language)
      @cms_values = CmsValue.joins(cms_page_section: [:cms_page, :cms_language]).where(cms_pages: { pagename: page_name }, cms_languages: { languagename: language })
      render :index
    end

    def filter_values_by_page_and_section(page_name, section_name)
      @cms_values = CmsValue.joins(cms_page_section: [:cms_page, :cms_section]).where(cms_pages: { pagename: page_name }, cms_sections: { sectionname: section_name })
      render :index
    end

    def filter_values_by_page_section_and_language(page_name, section_name, language)
      @cms_values = CmsValue.joins(cms_page_section: [:cms_page, :cms_section, :cms_language]).where(cms_pages: { pagename: page_name }, cms_sections: { sectionname: section_name }, cms_languages: { languagename: language })
      render :index
    end
end
