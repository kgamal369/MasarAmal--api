# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cms_values/index', type: :view do
  before(:each) do
    assign(:cms_values, [
             CmsValue.create!,
             CmsValue.create!
           ])
  end

  it 'renders a list of cms_values' do
    render
    Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
