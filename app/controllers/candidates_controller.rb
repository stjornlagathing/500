class CandidatesController < ApplicationController
  before_filter :find_candidate, :except => [:index, :aye, :nay, :maybe, :new, :create, :next]
  def index
    list(Candidate.all)
  end
  def aye
    list(current_user.aye)
  end
  def nay
    list(current_user.nay)
  end
  def maybe
    list(current_user.maybe)
  end
  
  def next
    @candidate = current_user.next_candidate_to_review

    respond_to do |format|
      format.html { render :action => "show" }
      format.xml  { render :xml => @candidate }
    end
  end
  
  def vote_aye
    update_review(Review::AYE)
  end
  
  def vote_nay
    update_review(Review::NAY)
  end
  
  def vote_maybe
    update_review(Review::MAYBE)
  end
    
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @candidate }
    end
  end

  def new
    @candidate = Candidate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @candidate }
    end
  end

  def create
    @candidate = Candidate.new(params[:candidate])

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to(@candidate, :notice => 'Candidate was successfully created.') }
        format.xml  { render :xml => @candidate, :status => :created, :location => @candidate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @candidate.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @candidate.update_attributes(params[:candidate])
        format.html { redirect_to(@candidate, :notice => 'Candidate was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @candidate.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @candidate.destroy

    respond_to do |format|
      format.html { redirect_to(candidates_url) }
      format.xml  { head :ok }
    end
  end

  protected 
  def find_candidate
    @candidate = Candidate.find(params[:id])
  end
  def update_review(vote)
    review = current_user.review_for(@candidate)
    review.vote = vote
    review.save!
    redirect_to next_candidates_path
  end
  def list(collection)
    @candidates = collection

    respond_to do |format|
      format.html
      format.xml  { render :xml => @candidates }
    end
  end
end
