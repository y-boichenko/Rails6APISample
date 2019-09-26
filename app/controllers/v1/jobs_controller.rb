module V1
  class JobsController < ApiController

    before_action :set_job, only: [:show, :update, :destroy]

    # GET /jobs
    def index
      render json: Job.all, status: :ok
    end

    # GET /jobs/:id
    def show
      render json: @job, status: :ok
    end

    # POST /jobs
    def create
      render json: Job.create!(job_params), status: :created
    end

    # PUT /jobs/:id
    def update
      render json: @job.update!(job_params), status: :accepted
    end

    # DELETE /jobs/:id
    def destroy
      @job.destroy
      render json: {}, status: :no_content
    end

    private

    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.permit(:title, :description)
    end

  end
end