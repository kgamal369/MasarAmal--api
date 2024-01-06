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

  # Adding filters
  filter :languageid, as: :select, collection: -> { CmsLanguage.all.map { |l| [l.languagename, l.id] } }
  filter :pagesectionid, as: :select, collection: -> { CmsPageSection.includes(:cms_page, :cms_section).map { |ps| ["#{ps.cms_page.pagename} - #{ps.cms_section.sectionname}", ps.id] } }

  # Permitting parameters
  permit_params :value, :pagesectionid, :sectioncomponentid, :languageid

  form do |f|
    f.inputs do
      # Assuming CmsPageSection includes a reference to CmsPage
      f.input :pagesectionid, as: :select, collection: CmsPageSection.includes(:cms_page).map { |ps| [ps.cms_page.pagename, ps.id] }, input_html: { id: 'cms_page_select' }
      # Assuming CmsSectionComponent includes a reference to CmsSection and CmsComponent
      f.input :sectioncomponentid, as: :select, collection: CmsSectionComponent.includes(:cms_section, :cms_component).map { |sc| ["#{sc.cms_section.sectionname} - #{sc.cms_component.componentname}", sc.id] }, input_html: { id: 'cms_section_select' }
      f.input :languageid, as: :select, collection: CmsLanguage.all.map { |l| [l.languagename, l.id] }
      f.input :value
    end
    f.actions
  end
end
