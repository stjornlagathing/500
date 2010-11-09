require 'json'
require 'couchrest'

#stjornlagathing = JSON.parse(File.read(RAILS_ROOT + "/db/stjornlagathing-data.json"))
#puts "Data parsed"
#
#
#stjornlagathing.each do |c|
#  candidate = Candidate.new(:name => candidate["name"], :town => candidate["locality"], :bio => candidate["background"])
#  candidate.save!
#  puts "Candidate #{candidate["name"]} created!"
#end

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
    nc.save!
    puts "Candidate #{nc.name} created!"
  end
end
