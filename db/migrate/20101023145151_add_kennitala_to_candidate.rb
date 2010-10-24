class AddKennitalaToCandidate < ActiveRecord::Migration
  def self.up
    add_column :candidates, :kennitala, :string
  end

  def self.down
    remove_column :candidates, :kennitala
  end
end
