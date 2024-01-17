# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'section_components/edit', type: :view do
  let(:section_component) do
    SectionComponent.create!(
      CMSValue: 'MyString'
    )
  end

  before(:each) do
    assign(:section_component, section_component)
  end

  it 'renders the edit section_component form' do
    render

    assert_select 'form[action=?][method=?]', section_component_path(section_component), 'post' do
      assert_select 'input[name=?]', 'section_component[CMSValue]'
    end
  end
end
