# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

schiller_body = <<END_SCHILLER
Johann Christoph Friedrich von Schiller (* 10. November 1759 in Marbach am Neckar, Württemberg; † 9. Mai 1805 in Weimar, Sachsen-Weimar), 1802 geadelt, war ein deutscher Dichter, Philosoph und Historiker. Er gilt als einer der bedeutendsten deutschsprachigen Dramatiker, Lyriker und Essayisten.

Schiller wurde als einziger Sohn eines Militärarztes, der später den Rang eines Hauptmanns erreichte, und der Tochter eines Bäckers geboren. Mit seinen fünf Schwestern wuchs er in Gmünd, Lorch, später in Ludwigsburg auf. Dort besuchte er die Lateinschule und begann nach viermaligen Bestehen des Landesexamens 1773 das Studium der Rechtswissenschaften auf der Hohen Karlsschule. Drei Jahre später wechselte er zu Medizin und wurde 1780 promoviert. Gleich mit seinem Theaterdebüt, dem 1782 uraufgeführten Schauspiel Die Räuber, gelang Schiller ein bedeutender Beitrag zum Drama des Sturm und Drang und der Weltliteratur.

Nach seiner Flucht aus Württemberg fand er in Thüringen Schutz vor Verfolgung; der Militärarzt war in der Vergangenheit wegen unerlaubten Entfernung gemaßregelt worden und nun mit der Androhung des Landesherrn nach Festungshaft und Schreibverbot konfrontiert. 1783 begann Schiller mit den ersten Arbeiten zum Don Karlos. Als seine Anstellung als Theaterdichter am Nationaltheater Mannheim ausgelaufen war, reiste Schiller 1785 nach Leipzig zu seinem späteren Förderer Christian Gottfried Körner. In den folgenden Jahren lernte er Wieland, Herder und Goethe in Weimar kennen. Gemeinsam sollten sie die Weimarer Klassik prägen.

Viele seiner Theaterstücke gehören zum Standardrepertoire der deutschsprachigen Theater. Seine Balladen zählen zu den bekanntesten deutschen Gedichten.

Er war durch Geburt Württemberger, wurde später Staatsbürger von Sachsen-Weimar und erhielt 1792 zusätzlich die französische Staatsbürgerschaft verliehen, in Würdigung seines in Paris aufgeführten Dramas Die Räuber, das als Freiheitskampf gegen die Tyrannei verstanden wurde.
END_SCHILLER

Post.create(
    title: 'Friedrich Schiller',
    published_at: Time.now,
    body: schiller_body
)

frisch_body = <<END_FRISCH
Max Rudolf Frisch (* 15. Mai 1911 in Zürich; † 4. April 1991 ebenda) war ein Schweizer Schriftsteller und Architekt. Mit Theaterstücken wie Biedermann und die Brandstifter oder Andorra sowie mit seinen drei großen Romanen Stiller, Homo faber und Mein Name sei Gantenbein erreichte Frisch ein breites Publikum und fand Eingang in den Schulkanon. Darüber hinaus veröffentlichte er Hörspiele, Erzählungen und kleinere Prosatexte sowie zwei literarische Tagebücher über die Zeiträume 1946 bis 1949 und 1966 bis 1971.

Der junge Max Frisch empfand bürgerliche und künstlerische Existenz als unvereinbar und war lange Zeit unsicher, welchen Lebensentwurf er wählen sollte. Infolgedessen absolvierte Frisch nach einem abgebrochenen Germanistik-Studium und ersten literarischen Arbeiten ein Studium der Architektur und arbeitete einige Jahre lang als Architekt. Erst nach dem Erfolg seines Romans Stiller entschied er sich endgültig für ein Dasein als Schriftsteller und verließ seine Familie, um sich ganz dem Schreiben widmen zu können.

Im Zentrum von Frischs Schaffen steht häufig die Auseinandersetzung mit sich selbst, wobei viele der dabei aufgeworfenen Probleme als typisch für den postmodernen Menschen gelten: Finden und Behaupten einer eigenen Identität, insbesondere in der Begegnung mit den festgefügten Bildern anderer, Konstruktion der eigenen Biografie, Geschlechterrollen und ihre Auflösung sowie die Frage, was mit Sprache überhaupt sagbar sei. Im literarisch ausgestalteten Tagebuch, das Autobiografisches mit fiktionalen Elementen verbindet, findet Frisch eine literarische Form, die ihm in besonderem Maße entspricht und in der er auch seine ausgedehnten Reisen reflektiert. Nachdem er jahrelang im Ausland gelebt hatte, beschäftigte Frisch sich nach seiner Rückkehr zudem zunehmend kritisch mit seinem Heimatland, der Schweiz.
END_FRISCH

Post.create(
    title: 'Max Frisch',
    published_at: Time.now,
    body: frisch_body
)

goethe_body = <<END_GOETHE
Johann Wolfgang von Goethe (* 28. August 1749 in Frankfurt am Main als Johann Wolfgang Goethe; † 22. März 1832 in Weimar, geadelt 1782) gilt als einer der bedeutendsten Repräsentanten deutschsprachiger Dichtung.

Goethe stammte aus einer angesehenen bürgerlichen Familie; sein Großvater mütterlicherseits war als Stadtschultheiß höchster Justizbeamter der Stadt Frankfurt, sein Vater Doktor der Rechte und kaiserlicher Rat. Er und seine Schwester Cornelia erfuhren eine aufwendige Ausbildung durch Hauslehrer. Dem Wunsch seines Vaters folgend, studierte Goethe in Leipzig und Straßburg Rechtswissenschaft und war danach als Advokat in Wetzlar und Frankfurt tätig. Gleichzeitig folgte er seiner Neigung zur Dichtkunst, mit dem Drama Götz von Berlichingen erzielte er einen frühen Erfolg und Anerkennung in der literarischen Welt.

Als Sechsundzwanzigjähriger wurde er an den Hof von Weimar eingeladen, wo er sich schließlich für den Rest seines Lebens niederließ. Er bekleidete dort als Freund und Minister des Herzogs Carl August politische und administrative Ämter und leitete ein Vierteljahrhundert das Hoftheater. Die amtliche Tätigkeit mit der Vernachlässigung seiner schöpferischen Fähigkeiten löste nach dem ersten Weimarer Jahrzehnt eine persönliche Krise aus, der sich Goethe durch die Flucht nach Italien entzog. Die zweijährige Italienreise empfand er wie eine „Wiedergeburt“. Ihr verdankte er die Vollendung wichtiger Werke (Tasso, Iphigenie, Egmont).

Nach seiner Rückkehr wurden seine Amtspflichten weitgehend auf repräsentative Aufgaben beschränkt. Der in Italien erlebte Reichtum an kulturellem Erbe stimulierte seine dichterische Produktion und die erotischen Erlebnisse mit einer jungen Römerin ließen ihn unmittelbar nach seiner Rückkehr eine dauerhafte, „unstandesgemäße“ Liebesbeziehung zu Christiane Vulpius aufnehmen, die er erst achtzehn Jahre später mit einer Eheschließung amtlich legalisierte.

Goethes literarische Produktion umfasst Lyrik, Dramen, Epik, autobiografische, kunst- und literaturtheoretische sowie naturwissenschaftliche Schriften. Daneben ist sein umfangreicher Briefwechsel von literarischer Bedeutung. Goethe war Vorbereiter und wichtigster Vertreter des Sturm und Drang. Sein Roman Die Leiden des jungen Werthers machte ihn in Europa berühmt. Selbst Napoleon bat ihn zu einer Audienz anlässlich des Erfurter Fürstenkongresses. Im Bunde mit Schiller und gemeinsam mit Herder und Wieland verkörperte er die Weimarer Klassik. Die Wilhelm-Meister-Romane wurden zu beispielgebenden Vorläufern deutschsprachiger Künstler- und Bildungsromane. Sein Faust errang den Ruf als das bedeutendste Werk der deutschsprachigen Literatur. Im Alter wurde er auch im Ausland als Repräsentant des geistigen Deutschland angesehen.

Im Deutschen Kaiserreich wurde er zum deutschen Nationaldichter und Künder des „deutschen Wesens“ verklärt und als solcher für den deutschen Nationalismus vereinnahmt. Es setzte damit eine Verehrung nicht nur des Werks, sondern auch der Persönlichkeit des Dichters ein, dessen Lebensführung als vorbildlich empfunden wurde. Bis heute zählen Gedichte, Dramen und Romane von ihm zu den Meisterwerken der Weltliteratur.
END_GOETHE

Post.create(
    title: 'Johann Wolfgang von Goethe',
    published_at: nil,
    body: goethe_body
)

grass_body = <<END_GRASS
Günter Wilhelm Grass (* 16. Oktober 1927 in Danzig-Langfuhr, Freie Stadt Danzig als Günter Wilhelm Graß; † 13. April 2015 in Lübeck) war ein deutscher Schriftsteller, Bildhauer, Maler und Grafiker. Grass gehörte seit 1957 zur Gruppe 47 und wurde mit seinem Debütroman Die Blechtrommel 1959 zu einem international geachteten Autor der deutschen Nachkriegsliteratur.

Grass’ Werk und Rolle als Autor und politischer Intellektueller war und ist Gegenstand umfangreicher Forschung sowie des Medieninteresses im In- und Ausland. Seine zentrale Motivation war der Verlust seiner Heimat Danzig und die Auseinandersetzung mit der nationalsozialistischen Vergangenheit, die sich vielfach in seinen Werken widerspiegelt. Seine Popularität als Schriftsteller nutzte er häufig, um das politische und gesellschaftliche Tagesgeschehen öffentlich zu kommentieren. Er war langjährig in Wahlkämpfen für die SPD und die Grünen aktiv und präsent. Grass’ Bücher wurden in zahlreiche Sprachen übersetzt und teilweise verfilmt. Im Jahr 1999 erhielt er den Nobelpreis für Literatur, er wurde mit einer Vielzahl weiterer Auszeichnungen geehrt.
END_GRASS

Post.create(
    title: 'Günter Grass',
    published_at: Time.now,
    body: grass_body
)

brecht_body = <<END_BRECHT
Bertolt Brecht oder Bert Brecht (* 10. Februar 1898 als Eugen Berthold Friedrich Brecht in Augsburg; † 14. August 1956 in Ost-Berlin) war ein einflussreicher deutscher Dramatiker und Lyriker des 20. Jahrhunderts. Seine Werke werden weltweit aufgeführt. Brecht hat das epische Theater beziehungsweise „dialektische Theater“ begründet und umgesetzt.
END_BRECHT

Post.create(
    title: 'Bertolt Brecht',
    published_at: Time.now,
    body: brecht_body
)

walser_body = <<END_WALSER
Martin Johannes Walser (* 24. März 1927 in Wasserburg am Bodensee) ist ein deutscher Schriftsteller. Bekannt wurde Walser durch seine Darstellung innerer Konflikte der Antihelden in seinen Romanen und Erzählungen.
END_WALSER

Post.create(
    title: 'Martin Walser',
    published_at: Time.now,
    body: walser_body
)

hoelderlin_body = <<END_HOELDERLIN
Johann Christian Friedrich Hölderlin (* 20. März 1770 in Lauffen am Neckar, Herzogtum Württemberg; † 7. Juni 1843 in Tübingen, Königreich Württemberg) zählt zu den bedeutendsten deutschen Lyrikern. Sein Werk lässt sich in seiner Bedeutung innerhalb der deutschen Literatur um 1800 weder der Weimarer Klassik noch der Romantik zuordnen.
END_HOELDERLIN

Post.create(
    title: 'Johann Christian Friedrich Hölderlin',
    published_at: Time.now,
    body: hoelderlin_body
)

borchert_body = <<END_BORCHERT
Wolfgang Borchert (* 20. Mai 1921 in Hamburg; † 20. November 1947 in Basel, Schweiz) war ein deutscher Schriftsteller. Sein schmales Werk von Kurzgeschichten, Gedichten und einem Theaterstück machte Borchert nach dem Zweiten Weltkrieg zu einem der bekanntesten Autoren der Trümmerliteratur. Mit seinem Heimkehrerdrama Draußen vor der Tür konnten sich in der Nachkriegszeit weite Teile des deutschen Publikums identifizieren. Kurzgeschichten wie Das Brot, An diesem Dienstag oder Nachts schlafen die Ratten doch wurden als musterhafte Beispiele ihrer Gattung häufige Schullektüre. Der Vortrag der pazifistischen Mahnung Dann gibt es nur eins! begleitete viele Friedenskundgebungen.

Wolfgang Borchert schrieb schon in seiner Jugend zahlreiche Gedichte, dennoch strebte er lange den Beruf eines Schauspielers an. Nach einer Schauspielausbildung und wenigen Monaten in einem Tourneetheater wurde Borchert 1941 zum Kriegsdienst in die Wehrmacht eingezogen und musste am Angriff auf die Sowjetunion teilnehmen. An der Front zog er sich schwere Verwundungen und Infektionen zu. Mehrfach wurde er wegen Kritik am Regime des Nationalsozialismus und sogenannter Wehrkraftzersetzung verurteilt und inhaftiert.

Auch in der Nachkriegszeit litt Borchert stark unter den im Krieg zugezogenen Erkrankungen und einer Leberschädigung. Nach kurzen Versuchen, erneut als Schauspieler und Kabarettist aktiv zu werden, blieb er ans Krankenbett gefesselt. Dort entstanden zwischen Januar 1946 und September 1947 zahlreiche Kurzgeschichten und innerhalb eines Zeitraums von acht Tagen das Drama Draußen vor der Tür. Während eines Kuraufenthalts in der Schweiz starb er mit 26 Jahren an den Folgen seiner Lebererkrankung. Bereits zu Lebzeiten war Borchert durch die Radioausstrahlung seines Heimkehrerdramas im Januar 1947 bekannt geworden, doch sein Publikumserfolg setzte vor allem postum ein, beginnend mit der Theateruraufführung von Draußen vor der Tür am 21. November 1947, einen Tag nach seinem Tod.
END_BORCHERT

Post.create(
    title: 'Wolfgang Borchert',
    published_at: Time.now,
    body: borchert_body
)

bachmann_body = <<END_BACHMANN
Ingeborg Bachmann (* 25. Juni 1926 in Klagenfurt; † 17. Oktober 1973 in Rom; gelegentliches Pseudonym Ruth Keller) war eine österreichische Schriftstellerin. Sie gilt als eine der bedeutendsten deutschsprachigen Lyrikerinnen und Prosaschriftstellerinnen des 20. Jahrhunderts. Ihr zu Ehren wird seit 1977 jährlich der Ingeborg-Bachmann-Preis verliehen.
END_BACHMANN

Post.create(
    title: 'Ingeborg Bachmann',
    published_at: Time.now,
    body: bachmann_body
)

rilke_body = <<END_RILKE
Rainer Maria Rilke (* 4. Dezember 1875 in Prag; † 29. Dezember 1926 im Sanatorium Valmont bei Montreux, Schweiz; eigentlich: René Karl Wilhelm Johann Josef Maria Rilke) war Lyriker deutscher Sprache. Mit seiner in den „Neuen Gedichten“ vollendeten, von der bildenden Kunst beeinflussten Dinglyrik gilt er als bedeutender Dichter der literarischen Moderne.

Aus Rilkes Werk sind etliche Erzählungen, ein Roman und Aufsätze zu Kunst und Kultur sowie zahlreiche Übersetzungen von Literatur und Lyrik bekannt.

Sein umfangreicher Briefwechsel gilt als wichtiger Bestandteil seines literarischen Schaffens.
END_RILKE

Post.create(
    title: 'Rainer Maria Rilke',
    published_at: Time.now,
    body: rilke_body
)

george_body = <<END_GEORGE
Stefan Anton George (* 12. Juli 1868 in Büdesheim, heute Stadtteil von Bingen am Rhein; † 4. Dezember 1933 in Minusio bei Locarno) war ein deutscher Lyriker. Zunächst vor allem dem Symbolismus verpflichtet, wandte er sich nach der Jahrhundertwende vom reinen Ästhetizismus der zuvor in den Blättern für die Kunst propagierten „kunst für die kunst“ ab und wurde zum Mittelpunkt des nach ihm benannten, auf eigenen ästhetischen, philosophischen und lebensreformerischen Vorstellungen beruhenden George-Kreises.
END_GEORGE

Post.create(
    title: 'Stefan Anton George',
    published_at: nil,
    body: george_body
)

hoffmansthal_body = <<END_HOFMANNSTHAL
Hugo Laurenz August Hofmann, Edler von Hofmannsthal (genannt Hugo von Hofmannsthal; * 1. Februar 1874 in Wien; † 15. Juli 1929 in Rodaun bei Wien) war ein österreichischer Schriftsteller, Dramatiker, Lyriker, Librettist sowie Mitbegründer der Salzburger Festspiele. Er gilt als einer der wichtigsten Repräsentanten des deutschsprachigen Fin de Siècle und der Wiener Moderne.
END_HOFMANNSTHAL

Post.create(
    title: 'Hugo von Hofmannsthal',
    published_at: Time.now,
    body: hoffmansthal_body
)

doeblin_body = <<END_DOEBLIN
Bruno Alfred Döblin (* 10. August 1878 in Stettin; † 26. Juni 1957 in Emmendingen) war ein deutscher Psychiater und Schriftsteller. Sein episches Werk umfasst mehrere Romane, Novellen und Erzählungen, daneben verfasste er unter dem Pseudonym Linke Poot satirische Essays und Polemiken. Als führender Expressionist und Wegbereiter der literarischen Moderne in Deutschland integrierte Döblin früh das Hörspiel und Drehbuch in seinem Werk. 1920 veröffentlichte er den historischen Roman Wallenstein. Weiterhin setzte Döblin als avantgardistischer Romantheoretiker mit den Schriften An Romanautoren und ihre Kritiker. Berliner Programm, Bemerkungen zum Roman und Der Bau des epischen Werks zahlreiche Impulse in der erzählenden Prosa frei. Sein weitaus am stärksten rezipierter Roman ist Berlin Alexanderplatz.

Alfred Döblin stammte aus einer Familie assimilierter Juden. In seinem zehnten Lebensjahr trennte sich der Vater von seiner Frau und ließ die Familie mittellos zurück. Das plötzliche Verschwinden des Vaters traumatisierte den Jungen nachhaltig. Bereits in seinem letzten Schuljahr verfasste Döblin mehrere Erzählungen und einen Kurzroman. Nach dem Abitur studierte er Medizin und wurde 1905 promoviert. Ein Jahr darauf eröffnete er eine kassenärztliche Praxis und heiratete die Medizinstudentin Erna Reiss.

Die Metropole Berlin wurde Döblins eigentliche Heimat. Er schloss sich dem Sturmkreis um Herwarth Walden an. Döblin wurde mit seinem Erzählband Die Ermordung einer Butterblume und andere Erzählungen sowie den Romanen Die drei Sprünge des Wang-lun und Berge, Meere und Giganten zu einem der führenden Exponenten der expressionistischen Literatur. Im Ersten Weltkrieg war er als Lazarettarzt an der Westfront stationiert. In der Weimarer Republik wurde der streitbare Döblin einer der führenden Intellektuellen des linksbürgerlichen Spektrums.

1933 musste der Jude und Sozialist Döblin aus Deutschland flüchten, kehrte nach Ende des Zweiten Weltkrieges zurück, um Deutschland 1953 erneut resigniert zu verlassen. Große Teile seines literarischen Schaffens, darunter die Amazonas-Trilogie, die Novembertetralogie und der letzte Roman Hamlet oder Die lange Nacht nimmt ein Ende werden der Exil-Literatur zugeordnet. 1941 konvertierte er zum katholischen Glauben, bereits 1936 hatte Döblin die französische Staatsbürgerschaft angenommen.
END_DOEBLIN

Post.create(
    title: 'Alfred Döblin',
    published_at: Time.now,
    body: doeblin_body
)