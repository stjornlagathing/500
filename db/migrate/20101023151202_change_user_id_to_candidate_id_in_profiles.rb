class ChangeUserIdToCandidateIdInProfiles < ActiveRecord::Migration
  def self.up
    rename_column :profiles, :user_id, :candidate_id
  end

  def self.down
    rename_column :profiles, :candidate_id, :user_id
  end
end
