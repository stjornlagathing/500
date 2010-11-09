class UpdateCandidateModel < ActiveRecord::Migration
  def self.up
    add_column :candidates, :birthyear, :integer
    add_column :candidates, :background, :text
    add_column :candidates, :zip, :integer
    add_column :candidates, :email, :string
    add_column :candidates, :pitch, :text
    add_column :candidates, :title, :text
    add_column :candidates, :image_url, :string
    add_column :candidates, :detail_url, :string
    add_column :candidates, :idcode, :integer
  end

  def self.down
    remove_column :candidates, :zip
    remove_column :candidates, :email
    remove_column :candidates, :pitch
    remove_column :candidates, :title
    remove_column :candidates, :image_url
    remove_column :candidates, :detail_url
    remove_column :candidates, :idcode
    remove_column :candidates, :background
    remove_column :candidates, :birthyear
  end
end


