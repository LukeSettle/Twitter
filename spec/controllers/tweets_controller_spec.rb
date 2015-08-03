require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
	let(:tweet) { FactoryGirl.create(:tweet) }
	describe "GET #index" do
		it "works" do
			get :index
			expect(response).to have_http_status(:success)
		end
	end

	describe "GET #show" do
		it "works" do
			get :show, id: tweet.id
			expect(response).to have_http_status(:success)
		end
	end
end
