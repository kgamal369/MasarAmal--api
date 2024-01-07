# //app/admin/cms_values.rb
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

    # actions do |cms_value|
    #   # Add a link or button to open the form
    #   link_to 'Edit Value', edit_admin_cms_value_path(cms_value)
    # end
    actions

    div id: 'dynamic_cms_values' do
      render 'admin/cms_values/cms_value_form'
    end
  end

  # Adding filters
  filter :languageid, as: :select, collection: -> { CmsLanguage.all.map { |l| [l.languagename, l.id] } }
  filter :pagesectionid, as: :select, collection: -> { CmsPageSection.includes(:cms_page, :cms_section).map { |ps| ["#{ps.cms_page.pagename} - #{ps.cms_section.sectionname}", ps.id] } }

  # Permitting parameters
  permit_params :value, :pagesectionid, :sectioncomponentid, :languageid
  
  form do |f|
    f.inputs do
      f.input :pagesectionid, as: :select, collection: CmsPageSection.includes(:cms_page).map { |ps| [ps.cms_page.pagename, ps.id] }, input_html: { id: 'cms_page_select' }
      f.input :sectioncomponentid, as: :select, collection: CmsSectionComponent.includes(:cms_section, :cms_component).map { |sc| ["#{sc.cms_section.sectionname} - #{sc.cms_component.componentname}", sc.id] }, input_html: { id: 'cms_section_select' }
      f.input :languageid, as: :select, collection: CmsLanguage.all.map { |l| [l.languagename, l.id] }
      f.input :value
    end
    f.actions
  end

  show do
    attributes_table do
      row :pagesectionid
      row :sectioncomponentid
      row :languageid
      row :value
    end
  end
end