require 'rails_helper'

RSpec.describe "sections/new", type: :view do
  before(:each) do
    assign(:section, Section.new(
      Components: "MyString",
      Languages: "MyString",
      PageSection: "MyString",
      SectionComponent: "MyString",
      CMSValue: "MyString"
    ))
  end

  it "renders new section form" do
    render

    assert_select "form[action=?][method=?]", sections_path, "post" do

      assert_select "input[name=?]", "section[Components]"

      assert_select "input[name=?]", "section[Languages]"

      assert_select "input[name=?]", "section[PageSection]"

      assert_select "input[name=?]", "section[SectionComponent]"

      assert_select "input[name=?]", "section[CMSValue]"
    end
  end
end
