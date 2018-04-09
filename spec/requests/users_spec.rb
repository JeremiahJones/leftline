require 'rails_helper'

describe 'Users', type: :request do
  let!(:valid_users) { create_list(:valid_user, 10) }
  let(:valid_user_id) { valid_users.first.id }

  describe 'GET /users' do
    before { get users_path }

    it 'returns users' do
      expect(response).to have_http_status(200)
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
  end

  describe 'GET /users/:id' do
    before { get "/users/#{valid_user_id}" }

    context 'when the user exists' do
      it 'returns the user' do
        expect(response).to have_http_status(200)
        expect(json).not_to be_empty
        expect(json['id']).to eq(valid_user_id)
      end
    end

    context 'when the user does not exist' do
      # turn valid user id into an invalid one
      let(:valid_user_id) { 132 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("Couldn't find User with 'id'=132")
      end
    end
  end

  describe 'POST /users' do
    let(:valid_attributes) { { user: { gamer_name: Faker::OnePiece.island, created_by: '1', email: Faker::Internet.email, password: '22secrets!' } } }

    context 'when the request is valid' do
      before { post '/users', params: valid_attributes }

      it 'creates a user' do
        expect(response).to have_http_status(201)
        expect(json['gamer_name']).to eq(valid_attributes[:user][:gamer_name])
        expect(json['email']).to eq(valid_attributes[:user][:email])
      end
    end

    context 'when the request is invalid' do
      before { post '/users', params: { user: { gamer_name: Faker::HowIMetYourMother.character } } }

      it 'returns a 402 and a validation failure message' do
        expect(response).to have_http_status(422)
        expect(json['email'])
          .to eq(["can't be blank"])
      end
    end
  end

  describe 'PUT /users/:id' do
    let(:valid_attributes) { { user: { gamer_name: Faker::GameOfThrones.dragon } } }

    context 'when the user exists' do
      before { put user_path(valid_user_id), params: valid_attributes }

      it 'updates the user' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /users/:id' do
    before { delete user_path(valid_user_id) }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
