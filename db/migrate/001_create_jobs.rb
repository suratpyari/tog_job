class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string      :title
      t.text        :description
      t.string      :type
      t.references  :user
      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
