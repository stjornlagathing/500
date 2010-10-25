# == Schema Information
# Schema version: 20101024145339
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  identifier :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :reviews
  has_many :reviewed_candidates, :through => :reviews, :source => :candidate, :uniq => true
  
  has_many :aye,   :through => :reviews, :source => :candidate, :uniq => true, :conditions => {"reviews.vote" => Review::AYE}
  has_many :nay,   :through => :reviews, :source => :candidate, :uniq => true, :conditions => {"reviews.vote" => Review::NAY}
  has_many :maybe, :through => :reviews, :source => :candidate, :uniq => true, :conditions => {"reviews.vote" => Review::MAYBE}

  def next_candidate_to_review
    collection = Candidate.pending_for(self)
    if collection.blank?
      # All candidates reviewed. Start again with maybes
      collection = self.maybe
    end
    limit =  collection.size <= 0 ? 0 : collection.size - 1
    collection[rand_within(0..limit)]
  end
  def review_for(c)
    self.reviews.find_by_candidate_id(c) || self.reviews.new(:candidate => c)
  end

  def reviewed_percentage
    self.reviewed_candidates.size * 100 / Candidate.all.size
  end

end
