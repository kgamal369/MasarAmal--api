# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PageSectionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/page_sections').to route_to('page_sections#index')
    end

    it 'routes to #new' do
      expect(get: '/page_sections/new').to route_to('page_sections#new')
    end

    it 'routes to #show' do
      expect(get: '/page_sections/1').to route_to('page_sections#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/page_sections/1/edit').to route_to('page_sections#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/page_sections').to route_to('page_sections#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/page_sections/1').to route_to('page_sections#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/page_sections/1').to route_to('page_sections#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/page_sections/1').to route_to('page_sections#destroy', id: '1')
    end
  end
end
