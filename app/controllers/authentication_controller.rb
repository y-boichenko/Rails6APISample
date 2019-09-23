class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  api :POST, "/authenticate", "Authenticate user by email and password"
  error :code => 401, :desc => "Unauthorized"
  example <<-EOS
    {'auth_token': 'eyJhbG123iJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE123zMzM0MDB9.nDq_VRfTiVD0KXkO123JO9mKU3112In4'}
  EOS
  param :email, String, desc: 'users email', required: true
  param :password, String, desc: 'users password', required: true
  returns :code => 200, :desc => "a successful response" do
    property :access_token, String, :desc => "JWT token value"
  end

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password], params[:mfa_secret])

    if command.success?
      render json: { auth_token: command.result }, status: :ok
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

end
