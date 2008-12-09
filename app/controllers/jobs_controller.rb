class JobsController < ApplicationController

  before_filter :find_job, :only => [:show, :destroy]
  
  def index
    if params[:type] == "required"
      @jobs = RequiredJob.find(:all)
    else
      @jobs = AvailableJob.find(:all)
    end
  end
  
  def new
    if params[:type] == "required"
      @job = RequiredJob.new()
    else
      @job = AvailableJob.new()
    end
  end
  
  def create
    if params[:available_job]
      @job = AvailableJob.new(params[:available_job].merge({:user_id => current_user.id}))
    else
      @job = RequiredJob.new(params[:required_job].merge({:user_id => current_user.id}))
    end
    if @job.save
      redirect_to job_path(@job)
    else
      render :action => 'new'
    end
  end
  
  def show
  end
  
 private ###########################
 
  def find_job
    @job = Job.find(params[:id]) rescue nil
    unless @job
      flash[:error] = "Sorry, the page cannot be found."
      redirect_to jobs_path
    end
  end
 
end
