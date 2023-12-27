require 'rails_helper'

RSpec.describe "page_sections/edit", type: :view do
  let(:page_section) {
    PageSection.create!(
      SectionComponent: "MyString",
      CMSValue: "MyString"
    )
  }

  before(:each) do
    assign(:page_section, page_section)
  end

  it "renders the edit page_section form" do
    render

    assert_select "form[action=?][method=?]", page_section_path(page_section), "post" do

      assert_select "input[name=?]", "page_section[SectionComponent]"

      assert_select "input[name=?]", "page_section[CMSValue]"
    end
  end
end
