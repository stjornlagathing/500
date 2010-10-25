require 'faker'
require 'alea'

# http://is.wikipedia.org/wiki/Frambj%C3%B3%C3%B0endur_til_stj%C3%B3rnlaga%C3%BEings_%C3%A1_%C3%8Dslandi_2010
CANDIDATES = [
{:name =>'Aðalheiður Jóhannsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Ferskir straumar og stefnur, hefðir, venjur, mannréttindi, alþingi styrkt, réttaröryggi, umhverfi, náttúruauðlindir, sjálfbær þróun'},
{:name =>'Agnar Kristján Þorsteinsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Andri Ottesen', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Anna Benkovic Mikaelsdóttir', :gender => 'kvk', :town => 'Álftanes', :bio =>'Jöfnuður og jafnrétti, jafnt vægi atkvæða, eitt kjördæmi, persónukjör, reglur um þjóðaratkvæði.'},
{:name =>'Anna Kolbrún Árnadóttir', :gender => 'kvk', :town => 'Akureyri', :bio =>'Fylgja eftir meginsjónarmiðum og áherslum almennings, eins og þær munu koma fram á þjóðfundi, um stjórnskipan landsins, með heiðarleika, virðingu og opnum huga.'},
{:name =>'Anna María Bogadóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>''},
{:name =>'Arnaldur Gylfason', :gender => 'kk', :town => 'Reykjavík', :bio =>'Aðgreining framkvæmda- og löggjafarvalds, ráðherrar ekki þingmenn. Valdheimildir ráðherra, embættisveitingar, skipun dómara, atkvæðagreiðsla í mikilvægum málum.'},
{:name =>'Arndís Einarsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>''},
{:name =>'Arnfríður Guðmundsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Auðlindir í sameign þjóðar, samfélag byggt á jafnrétti og virðingu, jafnt aðgengi að þjónustu, lýðræðisleg þátttaka. Framtíðin er barna okkar og í þeirra þágu ber okkur að vinna'},
{:name =>'Auður Sigr. Kristinsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Réttlæti, jafnrétti, frelsi. Aukið lýðræði. Jöfnun atkvæðaréttar. Auðlindir í þjóðareigu. Sjálfstæði valdastoða þjóðfélagsins. Aðhald og gagnrýni eðlilegur þáttur stjórnkerfisins.'},
{:name =>'Árni Björn Guðjónsson', :gender => 'kk', :town => 'Höfuðborgarsvæðið', :bio =>'Samfélagssáttmáli þjóðarinnar, íbúalýðræði, og auðlindir í almannaþágu, þekking og vísindi grundvöllur stjórn landsins, óskir barna teknar alvarlega, rammi um  fjármálakerfið'},
{:name =>'Ágúst Hjörtur Ingþórsson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Réttlæti, sanngirni, sátt sem leiðarljós. Mannréttindi, þjóðaratkvæðagreiðslur, burðugra Alþingi. Náttúruauðlindir í þjóðareign. Faglegra framkvæmdavald og stjórnsýsla.'},
{:name =>'Ágúst Valfells', :gender => 'kk', :town => 'Kópavogur', :bio =>'Jöfnun atkvæðisréttar. Persónukjör – minnkun flokksræðis. Skýr aðskilnaður framkvæmdavalds, löggjafarvalds og dómsvalds. Eignarhald og nýting náttúruauðlinda.'},
{:name =>'Álfheiður Eymarsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Frelsi, jafnrétti og bræðralag'},
{:name =>'Ásdís Hlökk Theodórsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Sjálfbær þróun – Umhverfi – Auðlindir – Lýðræði – Jafnrétti'},
{:name =>'Ásta Leonhardsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>''},
{:name =>'Ástrós Gunnlaugsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Réttindi og lýðræðisleg þátttaka almennings, þrískipting valdsins, náttúruauðlindir í þjóðareigu.'},
{:name =>'Baldur Ágústsson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Á móti ESB. Orkan nýtt til að fullgera vandaðar vörur á íslandi. Vanda til meðferðar sjúkra, aldraðra og öryrkja. Ganga úr Schengen, Halda þjóðkirkjunni.'},
{:name =>'Bergljót Tul Gunnlaugsdóttir', :gender => '', :town => '', :bio =>'lýðræðislegar starfsaðferðir, tekin mið af niðurstöður þjóðfunda,persónukjör og óbreytt kjördæmaskipan, sjálfbærni'},
{:name =>'Bergvin Oddsson', :gender => 'kk', :town => 'Akureyri', :bio =>'Mannréttindi, réttindi fatlaðra/blindra, ráðherraábyrgð, kjördæmi'},
{:name =>'Birna Þórðardóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>''},
{:name =>'Björg Ólafsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Heiðarleiki, náungakærleikur, sjálfbærni, lýðræði, frelsi, réttlæti.'},
{:name =>'Björgvin Rúnar Leifsson', :gender => 'kk', :town => 'Húsavík', :bio =>''},
{:name =>'Björn M. Sigurjónsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Björn Sævar Einarsson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Andlegt og siðferðilegt gjaldþrot núverandi valdakerfis kallar á nýja stjórnarskrá með enn skýrari ákvæðum um þrískiptingu ríkisvaldsins. Jafnvel forsetaræði. Aukið beint lýðræði.'},
{:name =>'Bolli Héðinsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Borgþór Kærnested', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Bragi Skaftason', :gender => 'kk', :town => 'Reykjavík', :bio =>'Beint lýðræði, aðskilnaður ríkis og kirkju, auðlindir þjóðareign, þrískipting valds.'},
{:name =>'Breki Karlsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Brynjar Gunnarsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Brynjólfur Sveinn Ívarsson', :gender => 'kk', :town => 'Garðabær', :bio =>'Þrískipting valds, afdráttarlaus og einföld stjórnarskrá, þjóðaratkvæðagreiðsla fyrir framsali á völdum aðskilnaður ríkis og kirkju og náttúruréttur.'},
{:name =>'Charlotta Oddsdóttir', :gender => 'kvk', :town => 'Hafnarfjörður', :bio =>'Stjórnarskráin tryggi velferð og byggi á gildum sem þjóðfundur setur fram. Vinna við samningu verði fagleg, rök og mótrök rædd og sameiginleg niðurstaða fengin.'},
{:name =>'Davíð Blöndal', :gender => 'kk', :town => 'Reykjavik', :bio =>'Aukin völd fólksins og meira gagnsæi, þrískiptingu valdsins og skilgreind ábyrgð, langtímahugsun og jafnvægi í hagkerfinu, persónuvernd á stafrænum upplýsingum'},
{:name =>'Eðvald Einar Stefánsson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Réttindi barna, mannréttindi, grundvallarréttindi tryggð, góð einföld stjórnarskrá fyrir komandi kynslóðir'},
{:name =>'Eggert Ólafsson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Fagleg vinnubrögð á stjórnlagaþingi, grundvallarréttindi landsmanna, aukin lýðræðisþátttaka, valdmörk og ábyrgð stjórnvalda'},
{:name =>'Einar Magnús Einarsson', :gender => 'kk', :town => 'Kópasker', :bio =>'Aukið vald til þjóðarinnar, ráðherrar kosnir beint og sitja ekki á þingi,  lækka kosningaaldur, aðskilnaður ríkis og trúfélaga, endurskoða hlutverk forseta og auka frelsi.'},
{:name =>'Eiríkur Mörk Valsson', :gender => 'kk', :town => 'Kópavogi', :bio =>''},
{:name =>'Elías Blöndal Guðjónsson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Gegn umfangsmiklum breytingum á stjórnarskránni'},
{:name =>'Elías Halldór Ágústsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Erlingur Sigurðarson', :gender => 'kk', :town => 'Akureyri', :bio =>''},
{:name =>'Finnbjörn Gíslason', :gender => 'kk', :town => 'Búðardal', :bio =>''},
{:name =>'Friðrik Þór Guðmundsson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Virkara og beinna lýðræði, þjóðareign á auðlindum, aðskilnaður ríkis og kirkju og mið tekið af skýrum skilaboðum Þjóðfundar'},
{:name =>'Frosti Sigurjónsson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Aukið lýðræði'},
{:name =>'Gissur Pétursson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Gísli Hjartarson', :gender => 'kk', :town => 'Vestmannaeyjum', :bio =>''},
{:name =>'Grímur Sigurðarson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Gróa Friðgeirsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Stjórnarskráin er grunnstoð þjóðfélagsins, hún þarf að vera skrifuð af þjóðinni fyrir þjóðina.'},
{:name =>'Greta Ósk Óskarsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>''},
{:name =>'Guðbrandur Ólafsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Guðjón Sigurðsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Guðlaug Kristjánsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Stjórnarskrá  samin af þjóðinni, fyrir þjóðina.  Á skiljanlegu máli'},
{:name =>'Guðmundur Guðlaugsson', :gender => 'kk', :town => 'Sauðárkróki', :bio =>''},
{:name =>'Guðmundur Vignir Óskarsson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Virkt lýðræði, auðlindir í þjóðareign'},
{:name =>'Guðmundur Örn Ragnarsson', :gender => 'kk', :town => 'Seltjarnarnesi', :bio =>''},
{:name =>'Guðni Karl Harðarson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Nýjar hugsanir, ný skipting valds, beint lýðræði, málskotsréttur til þjóðarinnar, bein áhrif almennings á lögin yfir landið'},
{:name =>'Gunnar Grímsson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Betri stjórnun, aukið gagnsæi og alvöru lýðræði'},
{:name =>'Gunnar Hersveinn', :gender => 'kk', :town => 'Reykjavík', :bio =>'Valdið liggur hjá almenning sem setur handhöfum skýr valdmörk. Náttúruauðlindir áfram heima! Jafnræði, samábyrgð, sjálfbærni og frelsi'},
{:name =>'Gunnar Örn Stefánsson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Einstaklingskosningar, eitt kjördæmi, raunverulegt jafnrétti, skilvirk og gegnsæ ríkisstjórn, þjóðareign mikilvægra náttúruauðlinda.'},
{:name =>'Gunnar Þór Tómasson', :gender => 'kk', :town => 'Kópavogi', :bio =>''},
{:name =>'Gunnlaugur Ó. Johnson', :gender => 'kk', :town => 'Mosfellsbæ', :bio =>'Þrískipting valdsins í uppnámi vegna frekju stjórnmálamanna. Misvægi atkvæða  lögvarið. Auðlindum ráðstafað, eignir seldar á útsöluverði. Náttúra landsins óvarin fyrir ágangi skammsýnna manna. Stjórnarskrá þarf að endurskoða frá grunni.'},
{:name =>'Guttormur Þorsteinsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Halla Björg Evans', :gender => 'kvk', :town => 'Kópavogi', :bio =>'Algjör þrískipting ríkisvaldsins, valdmörk forseta, lýðræðisleg þátttaka almennings, standa vörð um framsal ríkisvaldsins, helstu stoðir stjórnskipunar skilgreindar, jafnt atkvæðavægi, eignarréttur yfir auðlindum, ráðherraábyrgð.'},
{:name =>'Halldór Guðjónsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Halldór Grétar Gunnarsson', :gender => 'kk', :town => 'Mosfellsbæ', :bio =>''},
{:name =>'Halldóra Kristín Thoroddsen', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Þrískipt ríkisvald, þjóðaratkvæði, eignarhald á auðlindum, stefna um umhverfismál, valdmörk forseta, hæfi ráði - ekki pólitísk tengsl'},
{:name =>'Harpa Hrönn Frankelsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Tryggja þarf aukið aðhald með stjórnvöldum og vernda réttindi borgaranna. Færa aukin völd beint til fólksins, tryggja eignarhald á sameiginlegum auðlindum okkar og endurskoða samband ríkis og kirkju.'},
{:name =>'Haukur Arnþórsson', :gender => 'Skilað inn', :town => '', :bio =>''},
{:name =>'Haukur Nikulásson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Einföldun og tæknivæðing kosningalaga með sameinuðu prófkjöri, flokkakjöri og persónukjöri. Landið eitt kjördæmi. Ríkisframlög til stjórnmálaflokka verði bönnuð.'},
{:name =>'Helga Sigurjónsdóttir', :gender => 'kvk', :town => 'Seltjarnarnesi', :bio =>'Lýðræði og mannréttindi. Jöfnun atkvæðisréttar. Þjóðaratkvæðagreiðslur. Valdhöfum sett skýr mörk. Þjóðareign auðlinda og sjálfbær nýting.'},
{:name =>'Herdís Dröfn Baldvinsdóttir', :gender => 'kvk', :town => 'Bretlandi', :bio =>'Draga úr valdi stjórnmálaflokka og hagsmunasamtaka. Aukið gagnsæi, skýr ábyrgð. Mannréttindi tryggð óháð efnahag. Náttúruauðlindir í þjóðareign. Landið eitt kjördæmi.'},
{:name =>'Hildigunnur Sverrisdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Vörumst viðbragðspólítík og þröngsýni. Leggjum lagalegan grunn fyrir framtíðarlýðræði; stjórnarskrá tryggi vettvang þar sem þjóðin getur stöðugt tekið gildi sín og markmið til endurskoðunar.'},
{:name =>'Hjalti Hugason', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Hjörtur Hjartarson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Skýra þarf mörk framkvæmdavalds og löggjafarvalds og auka áhrif kjósenda í kosningum. Þjóðin þarf sjálf að geta gripið inn í mál á hverjum tíma og varið mikilvægustu hagsmuni sína.'},
{:name =>'Hjörtur Smárason', :gender => 'kk', :town => 'Hafnarfjörður', :bio =>'Stjórnarskráin á að standa vörð um hagsmuni almennings í landinu og tryggja mannréttindi, jafnræði og skýra valddreifingu.'},
{:name =>'Hjörvar Pétursson', :gender => 'kk', :town => 'Þýskaland', :bio =>''},
{:name =>'Hrafn Sveinbjarnarson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Stjórnarskrá tryggi óskorað fullveldi og að yfirráð og ráðstöfun auðlinda séu tryggð í almannaeign. Ráðherrar séu ekki alþingismenn, þrískipting ríkisvaldsins sé raunveruleg.'},
{:name =>'Hreinn Pálsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Hrönn Kristinsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>''},
{:name =>'Húni Heiðar Hallsson', :gender => 'kk', :town => 'Akureyri', :bio =>''},
{:name =>'Iðunn Guðjónsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>''},
{:name =>'Illugi Jökulsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Inga Lind Karlsdóttir', :gender => 'kvk', :town => 'Garðabæ', :bio =>''},
{:name =>'Inga Jóna Þórisdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>''},
{:name =>'Ingibjörg Snorradóttir Hagalín', :gender => 'kvk', :town => 'Ísafjörður', :bio =>'Nútímavæðing stjórnarskrár, samræmi við raunveruleikann, mannréttindi, tunga, táknmál,'},
{:name =>'Íris Egilsdóttir', :gender => 'kvk', :town => 'Akureyri', :bio =>''},
{:name =>'Íris Lind Sæmundsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Jafnræði íbúa landsins tryggt. Athafnaskylda stjórnvalda v. misrétti. Fatlaðir og samkynhneigðir. Auðlindir í þjóðareign. Þjóðaratkvæðagr. Skarpari skil m. handhafa ríkisvalds'},
{:name =>'Jakobína Ingunn Ólafsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Tryggja að vilji almennings endurspeglist í aðgerðum ríkisvaldsins og yfirráð þjóðarinnar yfir náttúruauðlindum. Þjóðaratkvæðagreiðslur og skýr mörk valds og ábyrgðar.'},
{:name =>'Jakobína Edda Sigurðardóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Beint lýðræði, aðskilnaður löggjafar- og framkvæmdavalds, auðlindir þjóðareign, auðskilin stjórnarskrá, sterkara siðferði, minni spilling.'},
{:name =>'Jan Eric Jessen', :gender => 'kk', :town => 'Akureyri', :bio =>''},
{:name =>'Jóhannes Þór Skúlason', :gender => 'kk', :town => 'Hafnarfjörður', :bio =>'Stóraukið beint lýðræði, málskotsréttinn í hendur þjóðarinnar, skýrari aðgreiningu og takmörk ríkisvaldsins'},
{:name =>'Jóhann Hjalti Þorsteinsson', :gender => 'kk', :town => 'Fljótsdalshreppur', :bio =>'Að varsla mannréttinda verði skilgreind sem fyrsta hlutverk ríkisins, að hámark verði sett á fjölda kjörtímabila ráðamanna, að við hættum að einkavæða gróðann og þjóðnýta tapið, að ríki og kirkja verði aðskilin, að íslenska þjóðin lýsi aldrei yfir stríði á hendur öðrum þjóðum'},
{:name =>'Jón Jósef Bjarnason', :gender => 'kk', :town => 'Mosfellsbær', :bio =>'Auðskilin stjórnarskrá, kviðdómur í mikilvægum málum, þjóðaratkvæðisgreiðslur, kosning hæstaréttardómara, persónukjör, eitt kjördæmi, hámarkseta 2 kjörtímabil.'},
{:name =>'Jón Þorvaldur Heiðarsson', :gender => 'kk', :town => 'Akureyri', :bio =>''},
{:name =>'Jón Valur Jensson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Á móti ESB-aðild. Völd forsetans mikilvæg, þurfi skýrari skilgreiningu. Dregið úr valdi flokka á Alþingi, og opinberri fjárstuðnings til þeirra.'},
{:name =>'Jón Pétur Líndal', :gender => 'kk', :town => 'Austur-Hún.', :bio =>''},
{:name =>'Jón Ólafsson', :gender => 'kk', :town => 'Bifröst', :bio =>''},
{:name =>'Jón Pálmar Ragnarsson', :gender => 'kk', :town => 'Bæjarhreppur', :bio =>''},
{:name =>'Jón Steindór Valdimarsson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Stjórnarskráin á að enduspegla bestu manna yfirsýn eftir yfirvegun og rökræður. Til þess verks þarf að koma með opnum huga.'},
{:name =>'Jóna Sólveig Elínardóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Jafnrétti kynjanna. Endurskilgreining á hlutverki forseta. Jöfnun atkvæðavægis.'},
{:name =>'Jónas Pétur Hreinsson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Mannleg reisn og friðhelgi hennar. Ítarlegri málsskotsréttur. Persónukjör til Alþingis. Aðskilnaður ríkis og kirkju. Auðlindir óframseljanleg eign þjóðarinnar. Þingseta háð tímamörkum.'},
{:name =>'Jónas Kristjánsson', :gender => 'kk', :town => 'Seltjarnarnes', :bio =>''},
{:name =>'Jónas Tryggvason', :gender => 'kk', :town => 'Reykjavík', :bio =>'Friðsöm þjóð í friðsömu landi, hófsöm skipting valds, skipan kosningamála, mannréttindi, virkt lýðræði, jafnrétti, trúfrelsi, auðlindamál, menntun og alþjóðahygga.'},
{:name =>'Jórunn Edda Helgadóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Að stjórnarskráin verði byggð á mannréttindum allra og í heild miði að raunverulegri tryggingu mannréttinda – bæði félagslegra og borgaralegra réttinda, og óháð fjárhagslegri, félagslegri og lagalegri stöðu.'},
{:name =>'Júlíus Sólnes', :gender => 'kk', :town => 'Reykjavík', :bio =>'Þurfum nýja stjórnarskrá til að brjóta upp hinar óheppilegu og ólýðræðislegu stjórnunaraðferðir gamla flokkakerfisins. Sníða þarf stakk eftir vexti og minnka hið útblásna stjórnkerfi (200 ríkisstofnanir!).'},
{:name =>'Katrín Fjeldsted', :gender => 'kvk', :town => 'Reykjavík', :bio =>''},
{:name =>'Kjartan Jónsson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Beint lýðræði, aðskilnaður löggjafar- og framkvæmdavalds, aðskilnaður ríkis og kirkju, auðlindir þjóðareign, réttindi almennings gagnvart lögreglu og dómsvaldi verði tryggð.'},
{:name =>'Kjartan Ragnarsson', :gender => 'kk', :town => 'Borgarnes', :bio =>'Þrískipt vald í raun, ekki ráðherra á Alþingi, endurskoða forsetaembættið, endursk. kjördæmaskipun, þjóðareign sé þjóðareign.'},
{:name =>'Kolbrún Anna Björnsdóttir', :gender => 'kvk', :town => 'Kópavogur', :bio =>''},
{:name =>'Kristbjörg Þórisdóttir', :gender => 'kvk', :town => 'Mosfellsbær', :bio =>'Mannréttindi, lýðræði, sjálfsákvörðunarréttur þjóðarinnar, þjóðareign á auðlindum. Þrískipting ríkisvalds, efling Alþingis og helstu stofnana þess. Gæðum lands, þjóðar og samfélags verði skilað vel til komandi kynslóða.'},
{:name =>'Kristín Erna Arnardóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>''},
{:name =>'Kristín Jónsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>''},
{:name =>'Kristín Vala Ragnarsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>''},
{:name =>'Kristján Vigfússon', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Loftur Már Sigurðsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Lovísa Arnardóttir', :gender => 'kvk', :town => '-', :bio =>'Mannréttindi kvenna og barna, femínismi'},
{:name =>'Lúðvík Emil Kaaber', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Magnea J. Matthíasdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>''},
{:name =>'Maríanna Bergsteinsdóttir', :gender => 'kvk', :town => 'Biskupstungum', :bio =>'Mannréttindi borgaranna, þrískiptingu valds, hömlur á valdi, auðlindir fólksins'},
{:name =>'Margrét Cela', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Ekki nýja stjórnarskrá, endurbætur. Þrískipting valdsins, styrkja Alþingi, jafna atkvæðavægi, takmarka embættistíma forseta, þingmanna og ráðherra, auðlindir í þjóðareigu.'},
{:name =>'Margrét Dóra Ragnarsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Mannréttindi, jafnrétti, jafnræði, opin stjórnsýsla og sjálfbær þróun'},
{:name =>'Margrét Jensína Þorvaldsdóttir', :gender => 'kvk', :town => 'Akureyri', :bio =>'Heiðarleg vinnubrögð, virðing og opinn hugur um tillögur frá þjóðfundi, staðinn verði vörður um jafnræði og réttindi minnihlutahópa.'},
{:name =>'Michele Rebora', :gender => 'kk', :town => 'Mosfellsbær', :bio =>'Glöggt er gestsaugað'},
{:name =>'Mikael M. Karlsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Njáll Ragnarsson', :gender => 'kk', :town => 'Vestmannaeyjum', :bio =>''},
{:name =>'Ólafur Árni Halldórsson', :gender => 'kk', :town => 'Njarðvík', :bio =>''},
{:name =>'Ólafur Hannibalsson -->', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Ólafur Jónsson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Velferð án forræðishyggju. Hjálparhönd fyrir þá sem þurfa án handleiðslu fyrir þá sem henni hafna.'},
{:name =>'Ólafur Sigurðsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Óli Gneisti Sóleyjarson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Aðskilnaður ríkis og kirkju. Ítarlegri mannréttindakafli'},
{:name =>'Ólína Freysteindóttir', :gender => 'kvk', :town => 'Akureyri', :bio =>''},
{:name =>'Pawel Bartoszek', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Páll Blöndal', :gender => 'kk', :town => 'Mosfellsbær', :bio =>'Heiðarleiki og samvinna. Komandi kynslóðum til heilla.'},
{:name =>'Pétur Gunnlaugsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Pétur Björgvin Þorsteinsson', :gender => 'kk', :town => 'Akureyri', :bio =>''},
{:name =>'René Biasone', :gender => 'kk', :town => 'Reykjavík', :bio =>'Stjórnmál frjáls frá efnahagsvaldi, gegnsætt ríkisvald, aukna samhygð, vernd viðkvæmra hópa.'},
{:name =>'Reynir H. Antonsson ', :gender => 'kk', :town => 'Akureyri', :bio =>''},
{:name =>'Róbert Hlynur Baldursson', :gender => 'kvk', :town => 'Húsavík', :bio =>'Ríkisstjórn kosin beint. Rafrænt og milliliðalaust Alþingi. Landshlutastjórnir. Þjóðaratkvæðagreiðslur auðveldaðar. Auðlindir í þjóðareign. Sjá nánar á stjornlagathing.org.'},
{:name =>'Rósa Erlingsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>''},
{:name =>'Salvör Nordal', :gender => 'kvk', :town => 'Reykjavík', :bio =>''},
{:name =>'Sara Björg Sigurðardóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>'Skilgreina betur hlutverk forseta, Alþingis, stjórnvalda og dómstóla, skapa umgjörð fyrir þjóðaratkvæðagreiðslur, landið eitt kjördæmi, skilgreina náttúruauðlindir og notkun þeirra, aðskilja ríki og kirkju.'},
{:name =>'Sigríður Dögg Auðunsdóttir', :gender => 'kvk', :town => 'Mosfellsbæ', :bio =>''},
{:name =>'Sigurður Grétar Guðmundsson', :gender => 'kk', :town => 'Þorlákshöfn', :bio =>''},
{:name =>'Sigurður Hólm Gunnarsson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Mannréttindi. Réttur til þjóðaratkvæðagreiðslu. Jafnt vægi atkvæða. Takmarka vald yfirvalda til að styðja stríðsátök. Þjóðareign náttúruauðlinda. Aðskilnaður ríkis og kirkju.'},
{:name =>'Sigurður G. Tómasson', :gender => 'kk', :town => 'Mosfellsbær', :bio =>''},
{:name =>'Sigurlaug Þ. Ragnarsdóttir', :gender => 'kvk', :town => 'Mosfellsbær', :bio =>'Vernd borgarana gegn valdhöfum, persónukjör, beint lýðræði, mannréttindi, auðlindir fólksins, þjóðaratkvæðagreiðslur'},
{:name =>'Sigursteinn Másson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Sigvaldi Einarsson', :gender => 'kk', :town => 'Kópavogur', :bio =>'Með skynsemina að vopni býð ég mig fram til stjórnlagaþings'},
{:name =>'Sigþrúður Þorfinnsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>''},
{:name =>'Silja Bára Ómarsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>''},
{:name =>'Skafti Harðarson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Einstaklingsfrelsi - takmarka valdsvið ríkisins'},
{:name =>'Smári McCarthy', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Soffía Sigurðardóttir', :gender => 'kvk', :town => 'Selfoss', :bio =>'Lýðræði, mannréttindi og samfélagslega ábyrgð'},
{:name =>'Stefán Gíslason', :gender => 'kk', :town => 'Borgarnes', :bio =>'style=white-space:nowrap'},
{:name =>'Stefán Pálsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Steinar Immanúel Sörensen', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Sævar Ari Finnbogason', :gender => 'kk', :town => 'Hvalfjarðarsveit', :bio =>'Skýr þrískipting valds. Stjórnarskrá geri ekki upp á milli trúfélaga og tryggi rétt komandi kynslóða til að njóta náttúru og nýta auðlindir landsins'},
{:name =>'Svanur Sigurbjörnsson', :gender => 'kk', :town => 'Mosfellsbær', :bio =>'Virkara lýðræði (þjóðaratkvæði), meiri valddreifing, jafnrétti lífsskoðunarfélaga, þjóðareign auðlinda, náttúruvernd, endurskoðun forsetavalds og fyrirkomulags kosninga'},
{:name =>'Svavar Kjarrval Lúthersson', :gender => 'kk', :town => 'Hafnarfjörður', :bio =>''},
{:name =>'Sveinn Ágúst Kristinsson', :gender => 'kk', :town => 'Vestmannaeyjum', :bio =>'Afnema embætti forseta Íslands, aðskilnaður ríkis og kirkju, sama kjördæmaskipting, þjóðaratkvæðagreiðslur að þýskri fyrirmynd og ekkert Evrópusamband.'},
{:name =>'Theódór Skúli Halldórsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Valdís Steinarsdóttir', :gender => 'kvk', :town => 'Mosfellsbæ', :bio =>''},
{:name =>'Valgarður Guðjónsson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Þrískipting valds, mannréttindi, beint lýðræði, aðskilnaður ríkis og kirkju'},
{:name =>'Vigfús Andrésson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Viktor Orri Valgarðsson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Stjórnarskrá sem tekur mið af pólítískum raunveruleika og vilja fólksins. Beint lýðræði, samstöðulýðræði, skynsamleg valddreifing. Endurskoða/afnema kjördæmaskipan.'},
{:name =>'Vilhjálmur Andri Kjartansson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Vilhjálmur Þorsteinsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Þorbergur Þórsson', :gender => 'kk', :town => 'Reykjavík', :bio =>'Lýðræðisumbætur, jöfnuður og náttúruvernd.'},
{:name =>'Þorsteinn Ingimarsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Þorsteinn V. Sigurðsson', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Þorkell Helgason', :gender => 'kk', :town => 'Álftanes', :bio =>'Vörn gegn græðgi og afglöpum. Persónukjör. Vönduð vinnubrögð á stjórnlagaþingi. Breið sátt.'},
{:name =>'Þorvaldur Gylfason', :gender => 'kk', :town => 'Reykjavík', :bio =>''},
{:name =>'Þórgnýr Thoroddsen', :gender => 'kk', :town => 'Reykjavík', :bio =>'Straumlínulögun stjórnarskrár, mannvirðingar- og mannréttindaáherslur, trúfélög undir venjuleg félagalög, aflétta friðhelgi þingmanna. Rýna í stjórnarkskrána til góðs.'},
{:name =>'Þórunn Hálfdanardóttir', :gender => 'kvk', :town => 'Fljótsdalshérað', :bio =>'Persónukjör, rafrænar kosningar, auðlindir í eigu þjóðarinnar, mannréttindi og jafnrétti'},
{:name =>'Þórunn Hjartardóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>''},
{:name =>'Þórunn M Ólafsdóttir', :gender => 'kvk', :town => 'Reykjavík', :bio =>''}]

# a few random ones
FB_IDS = ["aitorgarciarey", "gommit", "nicole.pietrantoni" ]

def rand_candidate
  CANDIDATES[rand_within(0..(CANDIDATES.size-1))]
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
  c = Candidate.new(rand_candidate)
  c.age = rand_within(18..80)
  c.kennitala = rand_kn
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