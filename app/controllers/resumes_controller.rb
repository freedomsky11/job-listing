class ResumesController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @resumes = Resume.where(:job => params[:job_id])
  end

  def new
    @resume = Resume.new
    @job = Job.find(params[:job_id])
  end

  def create
    @resume = Resume.new(resume_params)
    @job = Job.find(params[:job_id])
    @resume.job = @job
    @resume.user = current_user
    if @resume.save
      redirect_to job_path(@job), notice: "Upload success."
    else
      render :new
    end
  end

  private

  def resume_params
    params.require(:resume).permit(:job_id, :user_id, :attachment)
  end
end
