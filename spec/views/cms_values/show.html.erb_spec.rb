# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cms_values/show', type: :view do
  before(:each) do
    assign(:cms_value, CmsValue.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
