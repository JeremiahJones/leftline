require 'rails_helper'

describe GameConfigurationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/game_configurations').to route_to('game_configurations#index')
    end

    it 'routes to #show' do
      expect(get: '/game_configurations/1').to route_to('game_configurations#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/game_configurations').to route_to('game_configurations#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/game_configurations/1').to route_to('game_configurations#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/game_configurations/1').to route_to('game_configurations#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/game_configurations/1').to route_to('game_configurations#destroy', id: '1')
    end
  end
end
