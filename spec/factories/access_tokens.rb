FactoryGirl.define do
  factory :access_token, class: Doorkeeper::AccessToken do
    resource_owner_id { create(:user).id }
    application
    expires_in 2.hours
  end

  factory :access_grant, class: Doorkeeper::AccessGrant do
    sequence(:resource_owner_id) { |n| n }
    application
    redirect_uri 'https://app.com/callback'
    expires_in 100
    scopes 'public write'
  end

  factory :application, class: Doorkeeper::Application do
    sequence(:name) { |n| "Application #{n}" }
    redirect_uri 'https://app.com/callback'
  end
end
