require 'json'
require 'couchrest'


def determine_kind_of_profile(url)
  case url
  when //
    
  end
end

Candidate.destroy_all
Review.destroy_all

db = CouchRest.database!("http://jongretar.couchone.com/stjornlagathing")
stjornlagathing = db.documents
stjornlagathing["rows"].each do |c|
  unless c['key'] == "_design/stjornlagathing"
    candidate = db.get(c['key'])
    nc = Candidate.new(:name => candidate["name"], 
                              :gender => candidate["sex"],
                              :birthyear => candidate["birthYear"],
                              :town => candidate["town"], 
                              :background => candidate["background"], 
                              :pitch => candidate["pitch"], 
                              :email => candidate["email"], 
                              :zip => candidate["zip"], 
                              :title => candidate["title"], 
                              :image_url => candidate["imageURL"], 
                              :detail_url => candidate["detailURL"], 
                              :idcode => candidate["idcode"])
                              
    candidate["links"].each do |link|
      kind = determine_kind_of_profile(link)
      puts "#{link} =========> #{kind}"
      nc.profiles.build(:network => determine_kind_of_profile(link), :url => link)
    end
    
    nc.save!
    puts "Candidate #{nc.name} created!"
  end
end
