require 'rails_helper'

RSpec.describe 'cmses/new', type: :view do
  before(:each) do
    assign(:cms, cms.new(
                   pageName: 'MyText',
                   language: 'MyText',
                   location: 'MyText',
                   type: 'MyText',
                   value: 'MyText'
                 ))
  end

  it 'renders new cms form' do
    render

    assert_select 'form[action=?][method=?]', cmses_path, 'post' do
      assert_select 'textarea[name=?]', 'cms[pageName]'

      assert_select 'textarea[name=?]', 'cms[language]'

      assert_select 'textarea[name=?]', 'cms[location]'

      assert_select 'textarea[name=?]', 'cms[type]'

      assert_select 'textarea[name=?]', 'cms[value]'
    end
  end
end
