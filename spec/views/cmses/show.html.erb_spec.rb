require 'rails_helper'

RSpec.describe "cmses/show", type: :view do
  before(:each) do
    assign(:cmse, Cmse.create!(
      PageName: "MyText",
      Language: "MyText",
      Location: "MyText",
      Type: "MyText",
      Value: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
