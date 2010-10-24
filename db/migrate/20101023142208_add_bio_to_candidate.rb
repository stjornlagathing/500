class AddBioToCandidate < ActiveRecord::Migration
  def self.up
    add_column :candidates, :bio, :text
  end

  def self.down
    remove_column :candidates, :bio
  end
end
