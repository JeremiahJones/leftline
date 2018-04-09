require 'rails_helper'

describe DefaultSettingsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/default_settings').to route_to('default_settings#index')
    end

    it 'routes to #show' do
      expect(get: '/default_settings/1').to route_to('default_settings#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/default_settings').to route_to('default_settings#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/default_settings/1').to route_to('default_settings#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/default_settings/1').to route_to('default_settings#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/default_settings/1').to route_to('default_settings#destroy', id: '1')
    end
  end
end
