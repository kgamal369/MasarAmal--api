require 'rails_helper'

RSpec.describe CmsValuesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/cms_values').to route_to('cms_values#index')
    end

    it 'routes to #new' do
      expect(get: '/cms_values/new').to route_to('cms_values#new')
    end

    it 'routes to #show' do
      expect(get: '/cms_values/1').to route_to('cms_values#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/cms_values/1/edit').to route_to('cms_values#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/cms_values').to route_to('cms_values#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/cms_values/1').to route_to('cms_values#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/cms_values/1').to route_to('cms_values#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/cms_values/1').to route_to('cms_values#destroy', id: '1')
    end
  end
end
