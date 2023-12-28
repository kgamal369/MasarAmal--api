require 'rails_helper'

RSpec.describe "sections/index", type: :view do
  before(:each) do
    assign(:sections, [
      Section.create!(
        Components: "Components",
        Languages: "Languages",
        PageSection: "Page Section",
        SectionComponent: "Section Component",
        CMSValue: "Cms Value"
      ),
      Section.create!(
        Components: "Components",
        Languages: "Languages",
        PageSection: "Page Section",
        SectionComponent: "Section Component",
        CMSValue: "Cms Value"
      )
    ])
  end

  it "renders a list of sections" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Components".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Languages".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Page Section".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Section Component".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cms Value".to_s), count: 2
  end
end