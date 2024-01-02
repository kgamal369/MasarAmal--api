require 'rails_helper'

RSpec.describe 'languages/new', type: :view do
  before(:each) do
    assign(:language, Language.new(
                        PageSection: 'MyString',
                        SectionComponent: 'MyString',
                        CMSValue: 'MyString'
                      ))
  end

  it 'renders new language form' do
    render

    assert_select 'form[action=?][method=?]', languages_path, 'post' do
      assert_select 'input[name=?]', 'language[PageSection]'

      assert_select 'input[name=?]', 'language[SectionComponent]'

      assert_select 'input[name=?]', 'language[CMSValue]'
    end
  end
end
