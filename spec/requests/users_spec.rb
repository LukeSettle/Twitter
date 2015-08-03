require 'request_helper'

describe UsersController do
  describe 'POST /users' do
    it 'allows registration' do
      password = SecureRandom.hex
      email = Faker::Internet.email

      payload = {
        user: {
          email: email,
          password: password
        }
      }
      post users_path, payload
      expect(response).to have_http_status(:success)
    end
  end
end
