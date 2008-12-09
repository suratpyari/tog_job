class Job < ActiveRecord::Base
  def user_profile
    return user.profile
  end
  belongs_to :user
  validates_presence_of :title, :description
end
