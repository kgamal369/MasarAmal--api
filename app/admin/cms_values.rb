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
  end

  # Removing unwanted filters
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
      else
        scope
      end
    end
  end

  # Permitting parameters
  permit_params :value, :pagesectionid, :sectioncomponentid, :languageid

  # Specific batch action for deletion
  batch_action :destroy_multiple do |ids|
    CmsValue.where(id: ids).destroy_all
    redirect_to collection_path, alert: "Deleted #{ids.count} items"
  end

  # Custom panel based on filter, displayed below the main table
  if params[:custom_filter]
    case params[:custom_filter][:custom_filter]
    when 'home_page_hero_arabic', 'home_page_hero_english'
      panel 'Details' do
        render 'custom_details', context: self, filter: params[:custom_filter][:custom_filter]
      end
    end
  end
end
