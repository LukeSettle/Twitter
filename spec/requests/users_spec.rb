require 'request_helper'

describe UsersController do
  describe 'POST /users' do
    it 'allows registration' do
      payload = {
        user: {
          email: Faker::Internet.email,
          password: SecureRandom.hex
        }
      }
      post users_path, payload
      expect(response).to have_http_status(:success)
      expect(json["data"]["id"]).to_not be_empty
    end

    it 'prevents dupe email' do
      user = FactoryGirl.create :user

      payload = {
        user: {
          email: user.email,
          password: SecureRandom.hex
        }
      }
      post users_path, payload
      expect(response).to have_http_status(:unprocessable_entity)
      expect(json["errors"]["email"]).to_not be_empty
    end
  end
end
