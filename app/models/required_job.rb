class RequiredJob < Job
  validates_presence_of :education, :skill
end
