# == Schema Information
# Schema version: 20101024145339
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
#

class Candidate < ActiveRecord::Base
  has_many :profiles
  
  named_scope :pending_for, lambda { |user|
        { :conditions => ['NOT EXISTS(SELECT * FROM reviews WHERE candidate_id=candidates.id and user_id = ?)', user.id]}
  }
  
  def avatar_url
    "/images/user/default-avatar.png"
  end
end
