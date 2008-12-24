class RequiredJob < Job
  validates_presence_of :education, :skills
end
