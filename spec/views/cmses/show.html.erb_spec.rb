require 'rails_helper'

RSpec.describe 'cmses/show', type: :view do
  before(:each) do
    assign(:cms, cms.create!(
                   pageName: 'MyText',
                   language: 'MyText',
                   location: 'MyText',
                   type: 'MyText',
                   value: 'MyText'
                 ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
