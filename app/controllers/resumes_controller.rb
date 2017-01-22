class ResumesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
  end

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.job = @job
    @resume.user = current_user

    if @resume.save
      redirect_to job_path(@job)
      flash[:notice] = "成功提交简历"
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:id])
    @resume.destroy

    redirect_to admin_job_path(@job),alert: "Resume Deleted"
  end

  private

  def resume_params
    params.require(:resume).permit(:content, :job_id, :user_id, :attachment)
  end
end
