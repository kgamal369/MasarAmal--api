# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'page_sections/index', type: :view do
  before(:each) do
    assign(:page_sections, [
             PageSection.create!(
               SectionComponent: 'Section Component',
               CMSValue: 'Cms Value'
             ),
             PageSection.create!(
               SectionComponent: 'Section Component',
               CMSValue: 'Cms Value'
             )
           ])
  end

  it 'renders a list of page_sections' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Section Component'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Cms Value'.to_s), count: 2
  end
end
