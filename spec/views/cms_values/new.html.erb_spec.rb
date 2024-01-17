# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cms_values/new', type: :view do
  before(:each) do
    assign(:cms_value, CmsValue.new)
  end

  it 'renders new cms_value form' do
    render

    assert_select 'form[action=?][method=?]', cms_values_path, 'post' do
    end
  end
end
