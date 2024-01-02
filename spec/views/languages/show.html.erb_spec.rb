require 'rails_helper'

RSpec.describe 'languages/show', type: :view do
  before(:each) do
    assign(:language, Language.create!(
                        PageSection: 'Page Section',
                        SectionComponent: 'Section Component',
                        CMSValue: 'Cms Value'
                      ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Page Section/)
    expect(rendered).to match(/Section Component/)
    expect(rendered).to match(/Cms Value/)
  end
end
