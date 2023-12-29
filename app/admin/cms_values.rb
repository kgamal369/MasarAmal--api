# app/admin/cms_values.rb
ActiveAdmin.register CmsValue do
  # Permitting the right parameters
  permit_params :value, :cms_page_section_id, :cms_section_component_id, :cms_language_id

  # Index page configuration with custom ordering and columns
  index do
    selectable_column
    id_column
    column :value
    column "Page Name" do |cms_value|
      cms_value.cms_page_section&.cms_page&.pagename
    end
    column "Section Name" do |cms_value|
      cms_value.cms_page_section&.cms_section&.sectionname
    end
    column "Component Name" do |cms_value|
      cms_value.cms_section_component&.cms_component&.componentname
    end
    column "Language Name", sortable: 'cms_language.languagename' do |cms_value|
      cms_value.cms_language&.languagename || "No associated language"
    end
    actions
  end
  
    # Set default sorting
    config.sort_order = 'cmsvalueid_asc'

    
    filter :value
    filter :cms_language_id, as: :select, collection: CmsLanguage.all.map { |lang| [lang.languagename, lang.id] }
    # filter :page_name, as: :select, collection: CmsPage.pluck(:pagename, :pageid)
    # Show page configuration

  show do
    attributes_table do
      row :value
      row :cms_page_section do |cms_value|
        if cms_value.cms_page_section
          "Page ID: #{cms_value.cms_page_section.cms_page.pageid}, Section Name: #{cms_value.cms_page_section.cms_section.section_name}"
        else
          "No associated page section."
        end
      end
      row :cms_section_component do |cms_value|
        if cms_value.cms_section_component
          "Section ID: #{cms_value.cms_section_component.cms_section.sectionid}, Component Name: #{cms_value.cms_section_component.cms_component.componentname}"
        else
          "No associated section component."
        end
      end
      row :cms_language do |cms_value|
        cms_value.cms_language&.languagename || "No associated language."
      end
    end
  end

  # Form configuration for Create and Edit actions
  form do |f|
    f.inputs do
      f.input :value
      f.input :cms_page_section, as: :select, collection: CmsPageSection.all.map { |ps| [ps.display_name, ps.id] }
      f.input :cms_section_component, as: :select, collection: CmsSectionComponent.all.map { |sc| [sc.display_name, sc.id] }
      f.input :cms_language, as: :select, collection: CmsLanguage.all.map { |lang| [lang.languagename, lang.id] }
    end
    f.actions
  end
end
