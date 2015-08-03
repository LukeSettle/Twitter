require 'request_helper'

RSpec.describe TweetsController do
  describe "POST /tweets" do
		it "rejects if short" do
			post tweets_path, tweet: { body: "123" }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(json['errors']['body']).to_not be_empty
    end
    it "rejects if too long" do
      post tweets_path, tweet: { body: Faker::Lorem.characters(201) }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(json['errors']['body']).to_not be_empty
    end
  end
end
