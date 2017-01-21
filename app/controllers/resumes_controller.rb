class ResumesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.find(params[:job_id])
  end

  def create
    @job = Job.find(params[:job_id])
  end

end
