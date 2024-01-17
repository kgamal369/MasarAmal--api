# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'components/edit', type: :view do
  let(:component) do
    Component.create!(
      Languages: 'MyString',
      PageSection: 'MyString',
      SectionComponent: 'MyString',
      CMSValue: 'MyString'
    )
  end

  before(:each) do
    assign(:component, component)
  end

  it 'renders the edit component form' do
    render

    assert_select 'form[action=?][method=?]', component_path(component), 'post' do
      assert_select 'input[name=?]', 'component[Languages]'

      assert_select 'input[name=?]', 'component[PageSection]'

      assert_select 'input[name=?]', 'component[SectionComponent]'

      assert_select 'input[name=?]', 'component[CMSValue]'
    end
  end
end
