require 'rails_helper'

RSpec.describe 'cmses/index', type: :view do
  before(:each) do
    assign(:cmses, [
             cms.create!(
               pageName: 'MyText',
               language: 'MyText',
               location: 'MyText',
               type: 'MyText',
               value: 'MyText'
             ),
             cms.create!(
               pageName: 'MyText',
               language: 'MyText',
               location: 'MyText',
               type: 'MyText',
               value: 'MyText'
             )
           ])
  end

  it 'renders a list of cmses' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
  end
end
