# app/admin/cms_values.rb
ActiveAdmin.register CmsValue do
  # Customizing the index page
  index do
    selectable_column
    id_column
    column 'Page Name' do |cms_value|
      cms_value.cms_page_section.cms_page.pagename
    end
    column 'Section Name' do |cms_value|
      cms_value.cms_section_component.cms_section.sectionname
    end
    column 'Component Name' do |cms_value|
      cms_value.cms_section_component.cms_component.componentname
    end
    column 'Language Name' do |cms_value|
      cms_value.cms_language.languagename
    end
    column 'Value', :value

    actions

    # Custom panel based on filter
    if params[:custom_filter]
      filter = params[:custom_filter][:custom_filter]
      if ['home_page_hero_arabic', 'home_page_hero_english'].include?(filter)
        panel 'Details' do
          render 'custom_details', context: self, filter: filter
        end
      else
        Rails.logger.error "Invalid filter: #{filter}"
      end
    end
  end

  # Define batch actions
  batch_action :destroy, confirm: "Are you sure you want to delete these items?" do |ids|
    CmsValue.where(id: ids).destroy_all
    redirect_to collection_path, alert: "The selected CmsValues have been deleted."
  end

  batch_action :dummy_action, label: "Dummy Action" do |ids|
    # Dummy action logic here
    redirect_to collection_path, notice: "Dummy action was successfully called on #{ids.count} items."
  end

  # Handle case where no batch action is specified
  batch_action :select_action do |ids|
    # Implement logic or redirect
    redirect_to collection_path, alert: "No action was selected."
  end
 
  batch_action :update_values do |ids, inputs|
    CmsValue.where(id: ids).each do |cms_value|
      cms_value.update(inputs)
    end

    redirect_to collection_path, notice: "Values updated successfully."
  end

  # Adding filters
  filter :cms_page_section_id, as: :select, collection: -> { CmsPageSection.all }
  filter :cms_language_id, as: :select, collection: -> { CmsLanguage.all }

  # Custom scopes
  scope :all, default: true
  scope 'Home Page Hero Section Arabic' do |scope|
    scope.where(pagesectionid: 1, languageid: 1)
  end

  scope 'Home Page Hero Section English' do |scope|
    scope.where(pagesectionid: 1, languageid: 2)
  end

  # Add a sidebar for custom filtering
  sidebar :custom_filter, only: :index do
    form_for :custom_filter, url: admin_cms_values_path, method: :get do |f|
      f.select :custom_filter, options_for_select(CmsValue.filter_options), include_blank: 'Select Filter'
      f.submit 'Filter'
    end
  end

  controller do
    def scoped_collection
      scope = super.includes(:cms_page_section, :cms_section_component, :cms_language)
      apply_custom_filter(scope)
    end

    private

    def apply_custom_filter(scope)
      filter = params[:custom_filter] || {}
      case filter[:custom_filter]
      when 'home_page_hero_arabic'
        scope.where(pagesectionid: 1, languageid: 1)
      when 'home_page_hero_english'
        scope.where(pagesectionid: 1, languageid: 2)
      # Add other cases here...
      else
        scope
      end
    end
  end
  # Permitting parameters
  permit_params :value, :pagesectionid, :sectioncomponentid, :languageid
end