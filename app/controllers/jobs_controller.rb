class JobsController < ApplicationController

  api :GET, '/jobs/:id'
  formats ['json']
  error :code => 401, :desc => "Unauthorized"
  error :code => 404, :desc => "Not Found", :meta => {:anything => "you can think of"}
  example " 'job': {'quantity': 5} "
  param :id, :number, desc: 'id of the requested job', :required => true
  returns :code => 200, :desc => "a successful response" do
    property :value1, String, :desc => "A string value"
    property :value2, Integer, :desc => "An integer value"
    property :value3, Hash, :desc => "An object" do
      property :enum1, ['v1', 'v2'], :desc => "One of 2 possible string values"
    end
  end
  def show
    # @job = Job.find(params[:id])
    render json: {job: {quantity: 5}}, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: {error: e}, status: :not_found
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      render json: @job, status: :created
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  private

  def job_params
    params.require(:job).permit(:quantity)
  end

end