# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pages/edit', type: :view do
  let(:page) do
    Page.create!(
      Sections: 'MyString',
      Components: 'MyString',
      Languages: 'MyString',
      PageSection: 'MyString',
      SectionComponent: 'MyString',
      CMSValue: 'MyString'
    )
  end

  before(:each) do
    assign(:page, page)
  end

  it 'renders the edit page form' do
    render

    assert_select 'form[action=?][method=?]', page_path(page), 'post' do
      assert_select 'input[name=?]', 'page[Sections]'

      assert_select 'input[name=?]', 'page[Components]'

      assert_select 'input[name=?]', 'page[Languages]'

      assert_select 'input[name=?]', 'page[PageSection]'

      assert_select 'input[name=?]', 'page[SectionComponent]'

      assert_select 'input[name=?]', 'page[CMSValue]'
    end
  end
end
