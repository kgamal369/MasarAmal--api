# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sections/edit', type: :view do
  let(:section) do
    Section.create!(
      Components: 'MyString',
      Languages: 'MyString',
      PageSection: 'MyString',
      SectionComponent: 'MyString',
      CMSValue: 'MyString'
    )
  end

  before(:each) do
    assign(:section, section)
  end

  it 'renders the edit section form' do
    render

    assert_select 'form[action=?][method=?]', section_path(section), 'post' do
      assert_select 'input[name=?]', 'section[Components]'

      assert_select 'input[name=?]', 'section[Languages]'

      assert_select 'input[name=?]', 'section[PageSection]'

      assert_select 'input[name=?]', 'section[SectionComponent]'

      assert_select 'input[name=?]', 'section[CMSValue]'
    end
  end
end
