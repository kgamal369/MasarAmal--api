# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'languages/edit', type: :view do
  let(:language) do
    Language.create!(
      PageSection: 'MyString',
      SectionComponent: 'MyString',
      CMSValue: 'MyString'
    )
  end

  before(:each) do
    assign(:language, language)
  end

  it 'renders the edit language form' do
    render

    assert_select 'form[action=?][method=?]', language_path(language), 'post' do
      assert_select 'input[name=?]', 'language[PageSection]'

      assert_select 'input[name=?]', 'language[SectionComponent]'

      assert_select 'input[name=?]', 'language[CMSValue]'
    end
  end
end
