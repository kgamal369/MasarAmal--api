require 'rails_helper'

RSpec.describe "cmses/edit", type: :view do
  let(:cmse) {
    Cmse.create!(
      PageName: "MyText",
      Language: "MyText",
      Location: "MyText",
      Type: "MyText",
      Value: "MyText"
    )
  }

  before(:each) do
    assign(:cmse, cmse)
  end

  it "renders the edit cmse form" do
    render

    assert_select "form[action=?][method=?]", cmse_path(cmse), "post" do

      assert_select "textarea[name=?]", "cmse[PageName]"

      assert_select "textarea[name=?]", "cmse[Language]"

      assert_select "textarea[name=?]", "cmse[Location]"

      assert_select "textarea[name=?]", "cmse[Type]"

      assert_select "textarea[name=?]", "cmse[Value]"
    end
  end
end
