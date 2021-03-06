# == Schema Information
# Schema version: 20101109133708
#
# Table name: candidates
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  gender     :string(255)
#  age        :integer
#  town       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  bio        :text
#  kennitala  :string(255)
#  birthyear  :integer
#  background :text
#  zip        :integer
#  email      :string(255)
#  pitch      :text
#  title      :text
#  image_url  :string(255)
#  detail_url :string(255)
#  idcode     :integer
#

class Candidate < ActiveRecord::Base
  has_many :profiles
  has_many :reviews
  
  named_scope :pending_for, lambda { |user|
        { :conditions => ['NOT EXISTS(SELECT * FROM reviews WHERE candidate_id=candidates.id and user_id = ?)', user.id]}
  }
  
  def avatar_url
    self.image_url
  end
  def years
    Date.today.year - self.birthyear
  end
end
