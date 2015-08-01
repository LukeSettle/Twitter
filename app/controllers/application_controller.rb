class ApplicationController < ActionController::API
  include ActionController::Serialization
  UnauthenticatedError     = Class.new(ActionController::ActionControllerError)
  UnauthorizedError     = Class.new(ActionController::ActionControllerError)
  rescue_from UnauthenticatedError, with: :unauthenticated
  rescue_from UnauthorizedError, with: :unauthorized

  def authenticate_user!
    return true if doorkeeper_token && doorkeeper_token.accessible?
    raise UnauthenticatedError
  end

  def current_user
    if doorkeeper_token && doorkeeper_token.accessible?
      User.find_by(id: doorkeeper_token.resource_owner_id)
    else
      nil
    end
  end

  def self.allow_cors(*methods)
    before_filter :cors_before_filter, :only => methods

    # Rails recommends to use :null_session for APIs
    protect_from_forgery with: :null_session, :only => methods
  end

  def cors_before_filter
    # Check that the `Origin` field matches our front-end client host
    if /\Ahttps?:\/\/localhost:8000\z/ =~ request.headers['Origin']
      headers['Access-Control-Allow-Origin'] = request.headers['Origin']
    end
  end

  private

  def unauthenticated(error)
    head :unauthorized
  end

  def unauthorized(error)
    head :forbidden
  end
end