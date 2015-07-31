Doorkeeper.configure do
  orm :active_record

  # This block will be called to check whether the resource owner is authenticated or not.
  resource_owner_authenticator do
    current_user
  end

  resource_owner_from_credentials do |routes|
    email = params[:email] if params[:email].present?
    u = User.find_for_database_authentication(email: email)
    u if u && u.valid_password?(params[:password])
  end

  use_refresh_token

  native_redirect_uri 'urn:ietf:wg:oauth:2.0:oob'

  grant_flows %w(assertion authorization_code client_credentials password)
end
  