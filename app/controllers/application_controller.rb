class ApplicationController < ActionController::API
  include ActionController::Serialization
  UnauthenticatedError     = Class.new(ActionController::ActionControllerError)
  UnauthorizedError     = Class.new(ActionController::ActionControllerError)
  rescue_from UnauthenticatedError, with: :unauthenticated
  rescue_from UnauthorizedError, with: :unauthorized

  def render_json_api obj
    if obj.respond_to? :total_pages
      render json: obj, content_type: "application/vnd.api+json", meta: {total_pages: obj.total_pages}
    else
      render json: obj, content_type: "application/vnd.api+json"
    end
  end

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

  private

  def unauthenticated(error)
    head :unauthorized
  end

  def unauthorized(error)
    head :forbidden
  end
end