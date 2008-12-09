module JobsHelper
  def head
    return "<h2> #{params[:type] == 'required' ? 'Required Jobs' : 'Available Jobs'}</h2>"
  end
end
