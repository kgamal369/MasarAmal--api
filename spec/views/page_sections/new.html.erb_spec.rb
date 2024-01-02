require 'rails_helper'

RSpec.describe 'page_sections/new', type: :view do
  before(:each) do
    assign(:page_section, PageSection.new(
                            SectionComponent: 'MyString',
                            CMSValue: 'MyString'
                          ))
  end

  it 'renders new page_section form' do
    render

    assert_select 'form[action=?][method=?]', page_sections_path, 'post' do
      assert_select 'input[name=?]', 'page_section[SectionComponent]'

      assert_select 'input[name=?]', 'page_section[CMSValue]'
    end
  end
end
