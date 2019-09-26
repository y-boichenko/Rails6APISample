module V1
  class UsersController < ApiController
    skip_before_action :doorkeeper_authorize!

    # POST /users
    def create
      render json: User.create!(user_params), status: :created
    end

    private

    def user_params
      params.permit(:email, :password)
    end
  end
end