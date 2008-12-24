class AvailableJob < Job
    validates_presence_of :skills, :company_name, :designation
end
