require 'rails_helper'

describe 'GameConfigurations', type: :request do
  let!(:valid_configs) { create_list(:valid_config, 10) }
  let(:valid_config_id) { valid_configs.first.id }

  describe 'GET /game_configurations' do
    before { get game_configurations_path }

    it 'returns game configurations' do
      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
  end

  describe 'GET /game_configurations/:id' do
    before { get "/game_configurations/#{valid_config_id}" }

    context 'when the record exists' do
      it 'returns the game configuration' do
        expect(response).to have_http_status(200)
        expect(json).not_to be_empty
        expect(json['id']).to eq(valid_config_id)
      end
    end

    context 'when the configuration does not exist' do
      # turn valid config id into an invalid one
      let(:valid_config_id) { 132 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("Couldn't find GameConfiguration with 'id'=132")
      end
    end
  end

  describe 'POST /game_configurations' do
    let(:valid_attributes) { { game_configuration: { game: Faker::OnePiece.island, created_by: '1', user_id: valid_config_id } } }

    context 'when the request is valid' do
      before { post '/game_configurations', params: valid_attributes }

      it 'creates a configuration' do
        expect(response).to have_http_status(201)
        expect(json['game']).to eq(valid_attributes[:game_configuration][:game])
      end
    end

    context 'when the request is invalid' do
      before { post '/game_configurations', params: { game_configuration: { settings: { Faker::LeagueOfLegends.champion => 'chocolate' } } } }

      it 'returns a 402 and a validation failure message' do
        expect(response).to have_http_status(422)
        expect(json['user'])
          .to eq(['must exist'])
        expect(json['game'])
          .to eq(["can't be blank"])
      end
    end
  end

  describe 'PUT /game_configurations/:id' do
    let(:valid_attributes) { { game_configuration: { game: Faker::GameOfThrones.dragon } } }

    context 'when the configuration exists' do
      before { put game_configuration_path(valid_config_id), params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /game_configurations/:id' do
    before { delete game_configuration_path(valid_config_id) }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
