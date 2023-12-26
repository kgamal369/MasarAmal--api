require 'rails_helper'

RSpec.describe "cmses/new", type: :view do
  before(:each) do
    assign(:cmse, Cmse.new(
      PageName: "MyText",
      Language: "MyText",
      Location: "MyText",
      Type: "MyText",
      Value: "MyText"
    ))
  end

  it "renders new cmse form" do
    render

    assert_select "form[action=?][method=?]", cmses_path, "post" do

      assert_select "textarea[name=?]", "cmse[PageName]"

      assert_select "textarea[name=?]", "cmse[Language]"

      assert_select "textarea[name=?]", "cmse[Location]"

      assert_select "textarea[name=?]", "cmse[Type]"

      assert_select "textarea[name=?]", "cmse[Value]"
    end
  end
end
