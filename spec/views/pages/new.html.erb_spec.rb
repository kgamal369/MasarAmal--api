require 'rails_helper'

RSpec.describe "pages/new", type: :view do
  before(:each) do
    assign(:page, Page.new(
      Sections: "MyString",
      Components: "MyString",
      Languages: "MyString",
      PageSection: "MyString",
      SectionComponent: "MyString",
      CMSValue: "MyString"
    ))
  end

  it "renders new page form" do
    render

    assert_select "form[action=?][method=?]", pages_path, "post" do

      assert_select "input[name=?]", "page[Sections]"

      assert_select "input[name=?]", "page[Components]"

      assert_select "input[name=?]", "page[Languages]"

      assert_select "input[name=?]", "page[PageSection]"

      assert_select "input[name=?]", "page[SectionComponent]"

      assert_select "input[name=?]", "page[CMSValue]"
    end
  end
end
