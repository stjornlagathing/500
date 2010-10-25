# == Schema Information
# Schema version: 20101024154654
#
# Table name: reviews
#
#  id           :integer         not null, primary key
#  candidate_id :integer
#  user_id      :integer
#  vote         :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Review < ActiveRecord::Base
  NAY = 0
  AYE = 1
  MAYBE = 2
  
  named_scope :aye, :conditions => {:vote => Review::AYE}
  named_scope :nay, :conditions => {:vote => Review::NAY}
  named_scope :maybe, :conditions => {:vote => Review::MAYBE}
  
  belongs_to :candidate
  belongs_to :user
end
