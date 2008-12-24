class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string      :designation, :experience, :company_name, :education
      t.text        :skills
      t.references  :user
      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
