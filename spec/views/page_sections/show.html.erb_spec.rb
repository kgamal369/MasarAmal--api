# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'page_sections/show', type: :view do
  before(:each) do
    assign(:page_section, PageSection.create!(
                            SectionComponent: 'Section Component',
                            CMSValue: 'Cms Value'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Section Component/)
    expect(rendered).to match(/Cms Value/)
  end
end
