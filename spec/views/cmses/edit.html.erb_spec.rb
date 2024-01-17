# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cmses/edit', type: :view do
  let(:cms) do
    cms.create!(
      pageName: 'MyText',
      language: 'MyText',
      location: 'MyText',
      type: 'MyText',
      value: 'MyText'
    )
  end

  before(:each) do
    assign(:cms, cms)
  end

  it 'renders the edit cms form' do
    render

    assert_select 'form[action=?][method=?]', cms_path(cms), 'post' do
      assert_select 'textarea[name=?]', 'cms[pageName]'

      assert_select 'textarea[name=?]', 'cms[language]'

      assert_select 'textarea[name=?]', 'cms[location]'

      assert_select 'textarea[name=?]', 'cms[type]'

      assert_select 'textarea[name=?]', 'cms[value]'
    end
  end
end
