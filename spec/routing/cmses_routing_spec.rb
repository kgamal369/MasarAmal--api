require 'rails_helper'

RSpec.describe CmsesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/cmses').to route_to('cmses#index')
    end

    it 'routes to #new' do
      expect(get: '/cmses/new').to route_to('cmses#new')
    end

    it 'routes to #show' do
      expect(get: '/cmses/1').to route_to('cmses#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/cmses/1/edit').to route_to('cmses#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/cmses').to route_to('cmses#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/cmses/1').to route_to('cmses#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/cmses/1').to route_to('cmses#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/cmses/1').to route_to('cmses#destroy', id: '1')
    end
  end
end
