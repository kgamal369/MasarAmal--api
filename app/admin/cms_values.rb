ActiveAdmin.register CmsValue do
  permit_params :value, :cms_page_section_id, :cms_section_component_id, :cms_language_id

  # Filters
  filter :cms_page_section_id, as: :select, collection: -> { CmsPageSection.all.map { |ps| [ps.display_name, ps.id] } }
  filter :cms_section_component_id, as: :select, collection: -> { CmsSectionComponent.all.map { |sc| [sc.display_name, sc.id] } }
  filter :cms_language_id, as: :select, collection: -> { CmsLanguage.all.map { |lang| [lang.languagename, lang.id] } }

  # Index Page Customization
  index do
    selectable_column
    id_column
    column :value
    column :cms_page_section do |cms_value|
      cms_value.cms_page_section.display_name if cms_value.cms_page_section
    end
    column :cms_section_component do |cms_value|
      cms_value.cms_section_component.display_name if cms_value.cms_section_component
    end
    column :cms_language do |cms_value|
      cms_value.cms_language.languagename if cms_value.cms_language
    end
    actions
  end

  # Form Configuration
  form do |f|
    f.inputs do
      f.input :value
      f.input :cms_page_section, as: :select, collection: CmsPageSection.all.map { |ps| [ps.display_name, ps.id] }
      f.input :cms_section_component, as: :select, collection: CmsSectionComponent.all.map { |sc| [sc.display_name, sc.id] }
      f.input :cms_language, as: :select, collection: CmsLanguage.all.map { |lang| [lang.languagename, lang.id] }
    end
    f.actions
  end

  # Show Page Customization
  show do
    attributes_table do
      row :value
      row :cms_page_section do |cms_value|
        cms_value.cms_page_section.display_name if cms_value.cms_page_section
      end
      row :cms_section_component do |cms_value|
        cms_value.cms_section_component.display_name if cms_value.cms_section_component
      end
      row :cms_language do |cms_value|
        cms_value.cms_language.languagename if cms_value.cms_language
      end
    end
  end
end
