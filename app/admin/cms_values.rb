# frozen_string_literal: true

# //app/admin/cms_values.rb
ActiveAdmin.register CmsValue do
  # Customizing the index page
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
  filter :pagesectionid, as: :select, collection: lambda {
                                                    CmsPageSection.includes(:cms_page, :cms_section).map do |ps|
                                                      ["#{ps.cms_page.pagename} - #{ps.cms_section.sectionname}", ps.id]
                                                    end
                                                  }

  # Permitting parameters
  permit_params :value, :pagesectionid, :sectioncomponentid, :languageid, :image, :page_id, :section_id, :component_id

  form do |f|
    f.inputs do
      f.input :page_id, as: :select, collection: CmsPage.all.map { |p| [p.pagename, p.id] },
                        input_html: { id: 'cms_page_select' }, label: 'Page Name'

      f.input :section_id, as: :select, collection: [],
                           input_html: { id: 'cms_section_select', disabled: true }, label: 'Section Name'

      f.input :component_id, as: :select, collection: [],
                             input_html: { id: 'cms_component_select', disabled: true }, label: 'Component Name'

      f.input :languageid, as: :select, collection: CmsLanguage.all.map { |l| [l.languagename, l.id] }

      if f.object.cms_section_component&.cms_component&.is_image_component?
        f.input :image, as: :file, input_html: { id: 'image_input', style: 'display: none;' }
      else
        f.input :value, as: :text, input_html: { id: 'value_input' }
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row 'Page Name' do |cms_value|
        cms_value.cms_page_section.cms_page.pagename
      end
      row 'Section Name' do |cms_value|
        cms_value.cms_section_component.cms_section.sectionname
      end
      row 'Component Name' do |cms_value|
        cms_value.cms_section_component.cms_component.componentname
      end
      row 'Language Name' do |cms_value|
        cms_value.cms_language.languagename
      end
      row 'Value' do |cms_value|
        if cms_value.cms_section_component.cms_component.is_image_component? && cms_value.image.attached?
          image_tag url_for(cms_value.image)
        else
          cms_value.value
        end
      end
    end
  end
end
