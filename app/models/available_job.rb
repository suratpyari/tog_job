class AvailableJob < Job
    validates_presence_of :skills, :company, :designation
end
