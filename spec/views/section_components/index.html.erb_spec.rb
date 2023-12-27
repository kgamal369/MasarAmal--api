require 'rails_helper'

RSpec.describe "section_components/index", type: :view do
  before(:each) do
    assign(:section_components, [
      SectionComponent.create!(
        CMSValue: "Cms Value"
      ),
      SectionComponent.create!(
        CMSValue: "Cms Value"
      )
    ])
  end

  it "renders a list of section_components" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Cms Value".to_s), count: 2
  end
end
