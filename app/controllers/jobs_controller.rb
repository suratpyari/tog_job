class JobsController < ApplicationController

  before_filter :find_job, :only => [:show, :destroy]
  before_filter :current_user?, :only => [:new, :create, :destroy]
  
  def index
    @jobs = params[:type] == "required" ? RequiredJob.find(:all) : AvailableJob.find(:all)
  end
  
  def new
    @job = params[:type] == "required" ? RequiredJob.new() : AvailableJob.new()
  end
  
  def create
    @job = params[:available_job] ? AvailableJob.new(params[:available_job].merge({:user_id => current_user.id})) : RequiredJob.new(params[:required_job].merge({:user_id => current_user.id}))
    @job.save ? (redirect_to job_path(@job)) : (render :action => 'new')
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
  
  def current_user?
    unless current_user
      flash[:error] = "Sorry we cannot process your request"
      redirect_to jobs_path
    end
  end
 
end
