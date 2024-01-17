# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'section_components/new', type: :view do
  before(:each) do
    assign(:section_component, SectionComponent.new(
                                 CMSValue: 'MyString'
                               ))
  end

  it 'renders new section_component form' do
    render

    assert_select 'form[action=?][method=?]', section_components_path, 'post' do
      assert_select 'input[name=?]', 'section_component[CMSValue]'
    end
  end
end
