require 'request_helper'

RSpec.describe TweetsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:user_token) { FactoryGirl.create(:access_token, resource_owner_id: user.id).token }

  describe "POST /tweets" do
		it "rejects if short" do
			post tweets_path, access_token: user_token, tweet: { body: "123" }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(json['errors']['body']).to_not be_empty
    end
    it "rejects if too long" do
      post tweets_path, access_token: user_token, tweet: { body: Faker::Lorem.characters(201) }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(json['errors']['body']).to_not be_empty
    end

    it "rejects if not logged in" do
      post tweets_path
      expect(response).to have_http_status(:unauthorized)
    end

    it "allows a tweet" do
      post tweets_path, access_token: user_token, tweet: FactoryGirl.attributes_for(:tweet)
      expect(response).to have_http_status(:success)
      expect(json["data"]["attributes"]["user_id"]).to eq user.id
    end
  end
end
