require 'rails_helper'

RSpec.describe "section_components/show", type: :view do
  before(:each) do
    assign(:section_component, SectionComponent.create!(
      CMSValue: "Cms Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Cms Value/)
  end
end
