# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cms_values/edit', type: :view do
  let(:cms_value) do
    CmsValue.create!
  end

  before(:each) do
    assign(:cms_value, cms_value)
  end

  it 'renders the edit cms_value form' do
    render

    assert_select 'form[action=?][method=?]', cms_value_path(cms_value), 'post' do
    end
  end
end
