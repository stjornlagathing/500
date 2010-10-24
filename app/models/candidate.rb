# == Schema Information
# Schema version: 20101023142208
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
#

class Candidate < ActiveRecord::Base
  has_many :profiles
  def avatar_url
    "/images/user/default-avatar.png"
  end
end
