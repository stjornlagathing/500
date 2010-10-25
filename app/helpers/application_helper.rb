module ApplicationHelper
  
  def is_aye(candidate)
    current_user.aye.include? candidate
  end
  
  def is_nay(candidate)
    current_user.nay.include? candidate
  end
  
  def is_maybe(candidate)
    current_user.maybe.include? candidate
  end
  
  
end
