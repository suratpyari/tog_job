class JobsController < ApplicationController

  before_filter :find_job, :only => [:show, :destroy, :edit, :update]
  before_filter :current_user?, :only => [:new, :create, :destroy, :edit, :update]
  before_filter :job_user?, :only => [:destroy, :edit, :update]
  
  def index
   @jobs = (params[:type] and params[:type].match(/required/)) ? RequiredJob.paginate(:page => params[:page] ? params[:page] : 1, :order => 'updated_at DESC') : AvailableJob.paginate(:page => params[:page] ? params[:page] : 1, :order => 'updated_at DESC')
  end
  
  def new
    @job = (params[:type] and params[:type].match(/required/)) ? RequiredJob.new() : AvailableJob.new()
  end
  
  def create
    @job = params[:available_job] ? AvailableJob.new(params[:available_job].merge({:user_id => current_user.id})) : RequiredJob.new(params[:required_job].merge({:user_id => current_user.id}))
    @job.save ? (redirect_to job_path(@job, :type => @job.class.to_s.downcase)) : (render :action => 'new')
  end
  
  def edit
    render :template => 'jobs/new'
  end
  
  def update
    @job.update_attributes(params[:job]) ? (redirect_to job_path(@job, :type => @job.class.to_s.downcase)) : (render :action => 'edit')
  end
  
  def show
  end
  
  def destroy
    flash[:ok] = "Job has been deleted successfully" if @job.destroy
    redirect_to :back
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
  
  def job_user?
    unless @job.user == current_user
      flash[:error] = "Sorry we cannot process your request"
      redirect_to jobs_path
    end
  end
 
end
