class Job < ActiveRecord::Base
  def user_profile
    return user.profile
  end
  belongs_to :user
  cattr_reader :per_page
  @@per_page = 5
end
