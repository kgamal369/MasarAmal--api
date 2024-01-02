require 'rails_helper'

RSpec.describe 'components/new', type: :view do
  before(:each) do
    assign(:component, Component.new(
                         Languages: 'MyString',
                         PageSection: 'MyString',
                         SectionComponent: 'MyString',
                         CMSValue: 'MyString'
                       ))
  end

  it 'renders new component form' do
    render

    assert_select 'form[action=?][method=?]', components_path, 'post' do
      assert_select 'input[name=?]', 'component[Languages]'

      assert_select 'input[name=?]', 'component[PageSection]'

      assert_select 'input[name=?]', 'component[SectionComponent]'

      assert_select 'input[name=?]', 'component[CMSValue]'
    end
  end
end
