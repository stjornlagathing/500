require 'faker'
require 'alea'

# http://en.wikipedia.org/wiki/List_of_Icelanders
NAMES = ["Björgólfur Thor Björgólfsson", "Björgólfur Guðmundsson", "Eggert Magnússon", "Hreiðar Már Sigurðsson", 
"Jón Ásgeir Jóhannesson", "Magnús Þorsteinsson", "Þorsteinn M. Jónsson", "Ágústa Eva Erlendsdóttir", 
"Anita Briem", "Baltasar Kormákur", "Bjarni Gautur", "Friðrik Þór Friðriksson", "Hilmir Snær Guðnason", 
"Hrafn Gunnlaugsson", "Karl Júlíusson", "Magnús Magnússon", "Magnús Scheving", "Margrét Vilhjálmsdóttir", "Marinó Sigurðsson", 
"Markús Örn Antonsson", "Ólafur Hannesson", "Ólafur Darri Ólafsson", "Örvar Þóreyjarson Smárason", "Ragnar Bragason", "Tinna Gunnlaugsdóttir", "Arnaldur Indriðason", "Davíð Stefánsson", "Einar Kárason", "Einar Már Guðmundsson", "Einar Benediktsson", 
"Einar Hjörleifsson Kvaran editor", "Guðmundur G. Hagalín", "Halldór Kiljan Laxness", "Hallgrímur Helgason", "Jón Kalman Stefánsson", "Jón Thoroddsen", "Jónas Hallgrímsson", "Jóhannes úr Kötlum", "Kristín Marja Baldursdóttir", "Magnús Magnússon", 
"Ólafur Jóhann Ólafsson", "Snorri Hjartarson", "Snorri Sturluson", "Steinunn Sigurðardóttir", "Stephan G. Stephansson", 
"Tómas Guðmundsson", "Vigdís Grímsdóttir", "Viktor Arnar Ingólfsson", "Þórarinn Eldjárn", "Þórbergur Þórðarson", 
"Ásmundur Sveinsson", "Bertel Thorvaldsen", "Einar Jónsson", "Einar Hákonarson", "Gunnfríður Jónsdóttir", 
"Ágústa Eva Erlendsdóttir", "Anna Mjöll singer and songwriter", "Björgvin Halldórsson", "Björk Guðmundsdóttir", "Bragi Ólafsson", 
"Diddú (Sigrún Hjálmtýsdóttir)", "Eggert Pálsson", "Emilíana Torrini", "Einar Örn Benediktsson", "Eiríkur Hauksson", 
"Garðar Thór Cortes", "Hafdís Huld", "Haukur Tómasson", "Hilmar Örn Hilmarsson", "Jón Leifs", "Jón Þór Birgisson", 
"Jóhanna Guðrún Jónsdóttir", "Kjartan Ólafsson", "Mugison", "Örvar Þóreyjarson Smárason", "Páll Óskar Hjálmtýsson (Paul Oscar)", 
"Ragnheiður Gröndal", "Sigurður Bragason", "Ari Þorgilsson", "Egill Skallagrímsson", "Eirík the Red", "Freydís Eiríksdóttir", 
"Guðmundur Arason", "Guðríðr Þorbjarnardóttir", "Ingólfur Arnarson", "Ísleifur Gissurarson", "Kolbeinn Tumason", "Leifr Eiríksson (Leifur Eiríksson)", "Loftur Sæmundsson", "Snorri Sturluson", "Þorfinnr Karlsefni", "Þorvaldr Eríksson", "Vilhjalmur Stefansson", 
"Þóra Magnúsdóttir", "Albert Guðmundsson", "Árni Sigfússon", "Ásgeir Ásgeirsson", "Birgitta Jónsdóttir", "Björn Bjarnason", 
"Davíð Oddsson", "Geir H. Haarde", "Halldór Ásgrímsson", "Halldór Blöndal", "Hannes Hafstein", "Hannibal Valdimarsson", 
"Jóhanna Sigurðardóttir", "Jón Baldvin Hannibalsson", "Jón Loftsson", "Jón Sigurðsson", "Kristján Eldjárn", 
"Ólafur Ragnar Grímsson", "Steingrímur Hermannsson", "Sveinn Björnsson", "Vigdís Finnbogadóttir", "Þorsteinn Pálsson", "Agnar Helgason", "Ari Þorgilsson", "Árni Magnússon", "Ásgeir Helgason", "Eiríkr Magnússon", "Gisli Gudjonsson", "Gísli Pálsson", 
"Guðbrandur Vigfússon", "Hannes Hólmsteinn Gissurarson", "Helgi Valdimarsson", "Hjörtur Þórðarson", "Kári Stefánsson", 
"Magnús Eiríksson", "Margrét Hermanns Auðardóttir", "Niels Finsen", "Páll Skúlason", "Reynir Bödvarsson", "Sigurdur Helgason", 
"Sigurður Nordal", "Sigurður Þórarinsson", "Snorri Sturluson", "Vilhjálmur Árnason", "Þór Whitehead", 
"Þorsteinn Gylfason", "Albert Guðmundsson", "Arnór Guðjohnsen", "Aron Gunnarsson", "Ásgeir Sigurvinsson", "Eiður Smári Guðjohnsen", 
"Guðni Bergsson", "Teitur Thordarson", "Heiðar Helguson", "Hermann Hreiðarsson", "Ívar Ingimarsson", "Jóhannes Karl Guðjónsson", "Bobby Fischer", "Friðrik Ólafsson", "Arnór Atlason", "Guðjón Valur Sigurðsson", "Ólafur Stefánsson", "Snorri Steinn Guðjónsson", 
"Jón Páll Sigmarsson", "Magnús Ver Magnússon", "Stefán Sölvi Pétursson", "Kristján Einar Kristjánsson", "Halldór Helgason", 
"Vala Flosadóttir"]

# a few random ones
FB_IDS = ["1412073788", "salicio", "valakirka", "sgilperez", "gommit" ]

def rand_name
  NAMES[rand_within(0..(NAMES.size-1))]
end
def rand_kn
  numbers =  *'0'..'9'
  kn = ''
  10.times { kn += numbers[rand(numbers.size - 1)]}
  kn
end

def have_rss(c)
  c.profiles.build(:network => Profile::RSS, :url => nil)
end

def have_flickr(c)
  c.profiles.build(:network => Profile::FLICKR, :url => nil)
end

def have_twitter(c)
  c.profiles.build(:network => Profile::TWITTER, :url => nil)
end

def have_wikipedia(c)
  c.profiles.build(:network => Profile::WIKIPEDIA, :url => nil)
end

def have_fb(c)
  id = FB_IDS[rand_within(0..(FB_IDS.size-1))]
  url = "https://graph.facebook.com/#{id}"
  c.profiles.build(:network => Profile::FB, :url => url)
end

    
500.times do |i|   
  attrbs = {:name => rand_name, 
            :kennitala => rand_kn,
            :bio => Faker::Lorem.paragraphs(5).join(' '),
            :age => rand_within(18..80)} 
                        
  c = Candidate.new(attrbs)                    
  # 75% chances of this happens
  frequently{have_rss(c)} 

  # 65% chances of this happens
  probably do
    have_flickr(c)
  end

  # 20% chances of this happens
  rarely do
    have_twitter(c)
  end

  # 5% chances of this happens
  almost_never do
    have_wikipedia(c) 
  end

  # 95% chances of this happens
  almost_always do
    have_fb(c)
  end
  c.save!
  puts "Candidate ##{i+1} - #{c.name} created!"
end     