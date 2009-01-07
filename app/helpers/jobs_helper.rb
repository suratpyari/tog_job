module JobsHelper


  def head
    head_string = ""
    if current_user
      head_string = "#{(params[:type] and params[:type].match(/required/)) ? link_to('Jobs Required', new_job_path(:type => 'required'), :class => 'button add') : link_to('Post Jobs', new_job_path, :class => 'button add')}<br />"
    end
    head_string += "<h2> #{(params[:type] and params[:type].match(/required/)) ? 'Required Jobs' : 'Available Jobs'}</h2>"
    head_string += "#{(params[:type] and params[:type].match(/required/)) ? 'If you are a developer and wants a job then post requirements here' : 'If you are a company and wants to hire developers then Post Jobs here'}"
    return head_string
  end
  
  def if_empty(jobs)
    if jobs.nil? || jobs.empty?
      return "Be the first one to post a #{(params[:type] and params[:type].match(/required/)) ? link_to('Jobs Required', new_job_path(:type => 'required'), :class => 'button add') : link_to('Available Jobs', new_job_path, :class => 'button add')}"
    end
  end
  
  
end
