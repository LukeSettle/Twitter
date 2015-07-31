require 'request_helper'

describe Doorkeeper::TokensController do
  describe 'POST /oauth/token' do
    it 'accepts an email and password' do
      password = SecureRandom.hex
      user = User.new
      user.email = Faker::Internet.email
      user.password = password
      user.confirm
      user.save!
      payload = {
        email: user.email,
        password: password,
        grant_type: "password"
      }
      post oauth_token_path, payload
      expect(response.status).to eq 200
    end
  end
end