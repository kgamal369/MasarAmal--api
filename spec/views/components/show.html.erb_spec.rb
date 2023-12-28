require 'rails_helper'

RSpec.describe "components/show", type: :view do
  before(:each) do
    assign(:component, Component.create!(
      Languages: "Languages",
      PageSection: "Page Section",
      SectionComponent: "Section Component",
      CMSValue: "Cms Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Languages/)
    expect(rendered).to match(/Page Section/)
    expect(rendered).to match(/Section Component/)
    expect(rendered).to match(/Cms Value/)
  end
end