module JobsHelper
  def head
    return "<h1> #{params[:type] == 'required' ? 'Required Jobs' : 'Available Jobs'}</h1>"
  end
end
