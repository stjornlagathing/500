# == Schema Information
# Schema version: 20101024145339
#
# Table name: profiles
#
#  id           :integer         not null, primary key
#  url          :string(255)
#  network      :string(255)
#  candidate_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Profile < ActiveRecord::Base
  RSS = "rss"
  FLICKR = "flickr"
  TWITTER = "twitter"
  WIKIPEDIA = "wikipedia"
  FB = "fb"
  
  
  belongs_to :candidate
end
