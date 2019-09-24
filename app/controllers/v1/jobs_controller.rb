module V1
  class JobsController < ApiController

    def index
      render json: Job.all
    end

    def show
      render json: Job.find(params[:id])
    end

    def create
    end

  end
end