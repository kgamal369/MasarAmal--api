require 'rails_helper'

RSpec.describe "cms_values/index", type: :view do
  before(:each) do
    assign(:cms_values, [
      CmsValue.create!(),
      CmsValue.create!()
    ])
  end

  it "renders a list of cms_values" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
