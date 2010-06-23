SOFT-DELIMITERS = "<,>" cm; 
DELIMITERS = "<.>" "<:>" "<!>" "<?>" "<|>" "<$.>" "<$:>" "<$!>" "<$?>" "<$|>" sent ;

LIST BOS              = (>>>);
LIST EOS              = (<<<);

LIST CLB              = (sent) (cm) (cnjsub);

LIST PrnPos           = (prn pos);
LIST PrnPersAnim      = (prn p1) (prn p2) (prn p3 m) (prn p3 f);
LIST Ord              = (ord) ("fyrstur"ri);
LIST Num              = (num) ("milljarður") ("þúsund") ("milljón");
LIST N                = (n);
LIST Verb             = (vblex);
LIST Inf              = (inf);
LIST Prep             = (pr);
LIST Adv              = (adv);
LIST Coord            = (cnjcoo);
LIST CnjAdv           = (cnjadv);

LIST Actv             = (actv);
LIST Midv             = (midv);

LIST Nom              = (nom);
LIST Acc              = (acc);
LIST Gen              = (gen);
LIST Dat              = (dat);

LIST CommVerb         = "tala" "segja" "mæla" "yrða" "spjalla" "kveða" "segja";
LIST Human            = (np ant) (np cog) (prn p2) (prn p3 m) (prn p3 f) ("enginn"ri prn ind);
LIST Family           = "móðir" "faðir" "bróðir" "systir" "pabbi" "mamma" "dóttir" "sonur" "afi" "amma" "frændi" "kærasti" "kærasta";

LIST ISLANDS          = "England" "Ísland" "Kúba" "Haítí" "Kanarí" "Kanaríeyjar" "Jótland"; 
LIST LANGUAGES        = "tungumál" "íslenska" "enska" "gríska";
LIST BUILDINGS        = ".*skóli"ri "sjúkrahús"ri; # eldahús

LIST @X               = @X;
LIST @N→              = @N→;
LIST @←N              = @←N;
LIST @SUBJ→           = @SUBJ→;
LIST @←SUBJ           = @←SUBJ;
LIST @←OBJ            = @←OBJ;

SET  VerbMidv         = Verb + Midv;
SET  Animate          = Human | Family;

SECTION

##
## NOUNS 
##

#   "bóndi"   : {0: "farmer", 1: "husband"};
SUBSTITUTE ("bóndi") ("bóndi:1") ("bóndi") + N (1C PrnPos OR PrnPersAnim + Gen);

#   "kona"   : {0: "woman", 1: "wife", 2: "lady"};
SUBSTITUTE ("kona") ("kona:1") ("kona") + N (1C PrnPos OR PrnPersAnim + Gen);

#   "himinn"  : {0: "sky", 1: "heaven"};
SUBSTITUTE ("himinn") ("himinn:1") ("himinn") + N (1 ("og")) (2 ("jörð")); # í upphafi

#   "land"    : {0: "land", 1: "country"};
SUBSTITUTE ("land") ("land:1") ("land") + N ((1 @←N) OR (-1 @N→));

#   "drottin" : {0: "king", 1: "lord"};
SUBSTITUTE ("drottin") ("drottin:1") ("drottin") + N (1C ("Guð"));

#   "sæti"    : {0: "seat", 1: "place"};
SUBSTITUTE ("sæti") ("sæti:1") ("sæti") + N (-1C Ord);

# "aðgerð"    : {0: "operation", 1: "measures", 2: "repairs"};
SUBSTITUTE ("aðgerð") ("aðgerð:1") ("aðgerð") + N (0 ("<aðgerða>")) (-1 ("grípa# til"));

# "dalur"     : {0: "valley", 1: "dollar"};
SUBSTITUTE ("dalur") ("dalur:1") ("dalur") + N (-1 Num);

# "mynt"      : {0: "coin", 1: "currency"};
SUBSTITUTE ("mynt") ("mynt:1") ("mynt") (-1* ("í" pr) BARRIER CLB);

# "maður"     : {0: "man", 1: "people"};
# 1) Um 1.2 milljónir manna eru heimilislausar.
SUBSTITUTE ("maður") ("maður:1") ("maður") + N (-1 @N→) (0 Gen);
SUBSTITUTE ("maður") ("maður:1") ("maður") + N (-1 Num) (0 Gen);

# "lag"       : {0: "layer", 2: "song"};
SUBSTITUTE ("lag") ("lag:1") ("lag") + N ((-1* ("syngja") + Verb BARRIER CLB) OR (1* ("syngja") + Verb BARRIER CLB));

# "rektor"    : {0: "vice chancellor", 1: "headmaster"};

# "bakki"     : {1: "bank", 1: "tray"};

##
## VERBS
##

# "skipa"     : {0: "order", 1: "appoint"};
SUBSTITUTE ("skipa") ("skipa:1") ("skipa") + Verb (1C Acc);

# "lýsa" :    : {0: "show", 1: "light", 2: "describe"};
SUBSTITUTE ("lýsa") ("lýsa:1") ("lýsa") + Verb (1C Acc);

# "leggja" : {0:"lay", 1:"park"};
SUBSTITUTE ("leggja") ("leggja:1") ("leggja") + Verb (1C Dat);

# "batna" : {0:"improve", 1:"get# better"};
SUBSTITUTE ("batna") ("batna:1") ("batna") + Verb ((-1C* @SUBJ→ + Dat BARRIER CLB) OR (1C* @←SUBJ + Dat BARRIER CLB));

# "blæða# út" : {0:"bleed# to death", 1:"be# bleeding to death"};
SUBSTITUTE ("blæða# út") ("blæða# út:1") ("blæða# út") + Verb ((-1C* @SUBJ→ + Dat BARRIER CLB) OR (1C* @←SUBJ + Dat BARRIER CLB));

# "halda" : {0:"hold", 1:"think"};
SUBSTITUTE ("halda") ("halda:1") ("halda") + Verb (1 ("að"));

# "telja" : {0:"count", 1:"reckon"};
SUBSTITUTE ("telja") ("telja:1") ("telja") + Verb (1 ("að"));
SUBSTITUTE ("telja") ("telja:1") ("telja") + Verb (1C* ("að") BARRIER CLB);

# "afgreiða" : {0: "serve", 1: "deal# with"};
SUBSTITUTE ("afgreiða") ("afgreiða:1") ("afgreiða") + Verb (1 ("mál"));

# "fylgja" :  {0:"accompany", 1:"keep# up", 2:"pay# attention", 3: "guide", 4: "support", 5: "follow"};
SUBSTITUTE ("fylgja") ("fylgja:1") ("fylgja" midv) (1C* ("með") BARRIER CLB);
SUBSTITUTE ("fylgja") ("fylgja:2") ("fylgja" midv) (1C* ("með") BARRIER CLB LINK 1* @←OBJ | @X BARRIER CLB);
SUBSTITUTE ("fylgja") ("fylgja:5") ("fylgja" vblex) (0 ("fylgja" vblex)) (1* ("tengill") + @←OBJ | @X BARRIER CLB) ;

# "heita"  : {0:"be# called", 1:"promise"};
SUBSTITUTE ("heita") ("heita:1") ("heita") + Verb (1 Dat) (-1 Nom);

# "eiga"   : {0:"own", 1:"have"};
SUBSTITUTE ("eiga") ("eiga:1") ("eiga") + Verb (1* Family + @←OBJ | Family + @X BARRIER CLB);
SUBSTITUTE ("eiga") ("eiga:1") ("eiga") + Verb (-1* @SUBJ→ LINK NOT 0 Animate);


## 
## PREPOSITIONS 
##

# "við" : {0: "with", 1: "to", 2: "beside"};
SUBSTITUTE ("við") ("við:1") ("við") (-1C* CommVerb BARRIER CLB) (1C Animate);

# "á" : {0:"on", 1:"in", 1:"at"};
SUBSTITUTE ("á") ("á:1") ("á") + Prep (1C ISLANDS OR LANGUAGES);
SUBSTITUTE ("á") ("á:2") ("á") + Prep (1C BUILDINGS);

##
## PARTICLES
##

# "sem" : {0: "that", 1: "who", 2: "which"};
#SUBSTITUTE (rel) (rel :0) ("sem"ri);

##
## ADJECTIVES 
## 

# "rómanskur" : {0: "Romance", 1: "Latin"};
SUBSTITUTE ("rómanskur") ("rómanskur:1") ("rómanskur" adj) (1C ("Ameríka"));

# "almennur": {0: "universal", 1: "common", 2: "general"}
SUBSTITUTE:auto_r764  ("almennur") ("almennur:2") ("almennur" adj) (0 ("almennur")) (1 ("kosning"));
SUBSTITUTE:auto_r78216  ("almennur") ("almennur:2") ("almennur" adj) (0 ("almennur")) (1 ("sjúkrahús")); 

## 
## ADVERBS
##

# "ámóta"     : {0: "similar", 1: "about as"};
SUBSTITUTE ("ámóta") ("ámóta:1") ("ámóta") + Adv (1* @←OBJ | @X BARRIER CLB);

# "um leið og" : {0: "as soon as", 1: "at the same time as"};
SUBSTITUTE ("um leið og") ("um leið og:1") ("um leið og") (NOT 1* Verb BARRIER CLB);
SUBSTITUTE ("um leið og") ("um leið og:1") ("um leið og") (NEGATE 1* Verb LINK 0 Coord LINK 1 Verb) ; # only fire if there cannot be found a 1* Verb 
