class User < ActiveRecord::Base
  has_many :jobs, :dependent => :destroy
end
