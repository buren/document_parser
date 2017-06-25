class ApplicationController < ActionController::API
  before_action :verify_api_auth_token

  def verify_api_auth_token
    env_token = ENV['API_AUTH_TOKEN']
    return if env_token.blank?
    return if params[:auth_token] == env_token

    render json: { status: 403, message: 'Invalid API auth token' }, status: :forbidden
  end
end
