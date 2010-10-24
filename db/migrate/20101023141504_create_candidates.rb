class CreateCandidates < ActiveRecord::Migration
  def self.up
    create_table :candidates do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.string :town

      t.timestamps
    end
  end

  def self.down
    drop_table :candidates
  end
end
