# //app/admin/cms_values.rb
ActiveAdmin.register CmsValue do
  permit_params :value, :pagesectionid, :sectioncomponentid, :languageid, :image, :pageid, :sectionid, :componentid

  index do
    selectable_column
    id_column
    column 'Page Name' do |cms_value|
      cms_value.cms_page_section&.cms_page&.pagename
    end
    column 'Section Name' do |cms_value|
      cms_value.cms_section_component&.cms_section&.sectionname
    end
    column 'Component Name' do |cms_value|
      cms_value.cms_section_component&.cms_component&.componentname
    end
    column 'Language Name' do |cms_value|
      cms_value.cms_language&.languagename
    end
    column 'Value' do |cms_value|
      if cms_value.cms_section_component&.cms_component&.is_image_component? && cms_value.image.attached?
        image_tag url_for(cms_value.image), size: '50x50'
      else
        cms_value.value
      end
    end
    actions
    div id: 'dynamic_cms_values' do
      render 'admin/cms_values/cms_value_form'
    end
  end

  # Adding filters
  filter :languageid, as: :select, collection: -> { CmsLanguage.all.map { |l| [l.languagename, l.id] } }
  filter :pagesectionid, as: :select, collection: lambda {
                                                    CmsPageSection.includes(:cms_page, :cms_section).map do |ps|
                                                      ["#{ps.cms_page.pagename} - #{ps.cms_section.sectionname}", ps.id]
                                                    end
                                                  }
  
  
  form do |f|
    f.inputs do
      f.input :pagesectionid, as: :select, collection: CmsPageSection.all.map { |ps| [ps.display_name, ps.id] }
      f.input :sectioncomponentid, as: :select, collection: CmsSectionComponent.all.map { |sc| [sc.display_name, sc.id] }, input_html: { id: 'section_component_select', data: { image_component_ids: CmsComponent.where(componenttype: 'Image').pluck(:componentid) } }
      f.input :languageid, as: :select, collection: CmsLanguage.all.map { |lang| [lang.languagename, lang.id] }
      f.input :value, as: :text, input_html: { id: 'value_input', style: 'display: none;' }
      f.input :image, as: :file, input_html: { id: 'image_input', style: 'display: none;' }
    end
    f.actions
  end
                                                  

  show do
    attributes_table do
      row :pagesectionid do |cms_value|
        cms_value.cms_page_section.display_name if cms_value.cms_page_section
      end
      row :sectioncomponentid do |cms_value|
        cms_value.cms_section_component.display_name if cms_value.cms_section_component
      end
      row :languageid do |cms_value|
        cms_value.cms_language.languagename if cms_value.cms_language
      end
      row :value
      row :image do |cms_value|
        if cms_value.image.attached?
          image_tag url_for(cms_value.image), size: '50x50'
        end
      end
    end
  end
     
end
