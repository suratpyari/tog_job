module JobsHelper


  def head
    head_string = "<h2> #{params[:type] == 'required' ? 'Required Jobs' : 'Available Jobs'}</h2>"
    if current_user
      head_string += params[:type] == 'required' ? 'If you are a developer and wants a job then '+link_to('post requirements', new_job_path(:type => 'required'), :class => 'button add')+' here' : 'If you are a company and wants to hire developers then '+link_to('Post Jobs', new_job_path, :class => 'button add')+' here'
    end
    return head_string
  end
  
  def if_empty(jobs)
    if jobs.nil? || jobs.empty?
      return "Be the first one to post a #{params[:type] == 'required' ? link_to('required job', new_job_path(:type => 'required'), :class => 'button add') : link_to('available job', new_job_path, :class => 'button add')}"
    end
  end
  
  
end
