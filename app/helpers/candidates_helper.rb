module CandidatesHelper
  #def show_review(c)
  #  return "Já" if is_aye(c)
  #  return "Kannski" if is_maybe(c)
  #  return "Nei" if is_nay(c)
  #end
  def show_review(c)
    return "Já" if current_user.review_for(c).vote == Review::AYE
    return "Kannski" if current_user.review_for(c).vote == Review::MAYBE
    return "Nei" if current_user.review_for(c).vote == Review::NAY
  end
end


