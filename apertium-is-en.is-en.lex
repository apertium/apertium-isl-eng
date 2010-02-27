DELIMITERS            = (sent) (".") ;
SOFT-DELIMITERS       = ("<,>") ;

LIST BOS              = (>>>);
LIST EOS              = (<<<);

LIST CLB              = (sent) (cm) (cnjsub);

LIST PrnPos           = (prn pos);
LIST PrnPersAnim      = (prn p1) (prn p2) (prn p3 m) (prn p3 f);
LIST Ord              = (ord) ("fyrstur"ri);
LIST Num              = (num) ("milljarður"ri) ("þúsund"ri);
LIST N                = (n);
LIST Verb             = (vblex);

LIST Acc              = (acc);
LIST Gen              = (gen);
LIST Dat              = (dat);

LIST CommVerb         = "tala" "segja" "mæla" "yrða" "spjalla" "kveða" "segja";
LIST Human            = (np ant) (np cog) (prn p2) (prn p3 m) (prn p3 f) ("enginn"ri prn ind);

LIST ISLANDS          = "England" "Ísland" "Kúba" "Haítí" "Kanarí" "Kanaríeyjar" "Jótland"; 
LIST LANGUAGES        = "íslenska" "enska" ;
LIST BUILDINGS        = ".*skóli"ri ".*hús"ri;

LIST @N→              = @N→;
LIST @←N              = @←N;
LIST @SUBJ→           = @SUBJ→;
LIST @←SUBJ           = @←SUBJ;

SECTION

##
## NOUNS 
##

#   "bóndi"   : {0: "farmer", 1: "husband"};
SUBSTITUTE ("bóndi") ("bóndi:1") ("bóndi") + N (1C PrnPos OR PrnPersAnim + Gen);

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
SUBSTITUTE ("maður") ("maður:1") ("maður") (-1 @N→) (0 Gen);

# "rektor"    : {0: "vice chancellor", 1: "headmaster"};

# "bakki"     : {1: "bank", 1: "tray"};

##
## VERBS
##

# "skipa"     : {0: "order", 1: "appoint"};
SUBSTITUTE ("skipa") ("skipa:1") ("skipa") + Verb (1C Acc);

# "lýsa" : 
#       0:"show"
#       1:"light"
#       2:"describe"
#SUBSTITUTE (vblex) (vblex :0) ("lýsa"ri);
SUBSTITUTE (vblex :0) (vblex :1) ("lýsa"ri) (1C Acc);

# "greiða" : 
#       0:"pay"
#       1:"comb"
#SUBSTITUTE (vblex) (vblex :0) ("greiða"ri);
#SUBSTITUTE (vblex :0) (vblex :1) ("greiða"ri) (1C Dat);

# "leggja" : 
#       0:"lay"
#       1:"park"
#SUBSTITUTE (vblex) (vblex :0) ("leggja"ri);
SUBSTITUTE (vblex :0) (vblex :1) ("leggja"ri) (1C Dat);

# "þýða" : 
#       0:"mean"
#       1:"translate"
#SUBSTITUTE (vblex) (vblex :0) ("þýða"ri);

# "batna" : 
#        0:"improve"
#        1:"get# better"
#SUBSTITUTE (vblex) (vblex :0) ("batna"ri);
SUBSTITUTE (vblex :0) (vblex :1) ("batna"ri) ((-1C* @SUBJ→ + Dat BARRIER CLB) OR (1C* @←SUBJ + Dat BARRIER CLB));

# "halda" : 
#        0:"hold"
#        1:"think"
#SUBSTITUTE (vblex) (vblex :0) ("halda"ri);
SUBSTITUTE (vblex :0) (vblex :1) ("halda"ri) (1 ("að"));

# "telja" : 
#        0:"count"
#        1:"reckon"
#SUBSTITUTE (vblex) (vblex :0) ("telja"ri);
SUBSTITUTE (vblex :0) (vblex :1) ("telja"ri) (1 ("að"));

# "afgreiða" : 
#        0:"serve"
#        1:"deal# with"
#SUBSTITUTE (vblex) (vblex :0) ("afgreiða"ri);
SUBSTITUTE (vblex :0) (vblex :1) ("afgreiða"ri) (1 ("mál"));

# "jafna" : 
#        0:"level"
#        1:"equalise"
#        2:"compare"
#SUBSTITUTE (vblex) (vblex :0) ("jafna"ri);

# "fylgja" : 
#        0:"accompany"
#        1:"keep up"
#        2:"pay attention"
#SUBSTITUTE (vblex) (vblex :0) ("fylgja"ri);
SUBSTITUTE (vblex :0) (vblex :1) ("fylgja"ri vblex midv) (1C* ("með") BARRIER CLB);
SUBSTITUTE (vblex :0) (vblex :2) ("fylgja"ri vblex midv) (1C* ("með") BARRIER CLB LINK 1* (@X));

# "benda" : 
#        0:""
#        1:""
#        2:""
#SUBSTITUTE (vblex) (vblex :0) ("benda"ri);


## 
## PREPOSITIONS 
##

# "við" : 
#      0: "with"
#      1: "to"
#      2: "beside"
SUBSTITUTE (pr) (pr :0) ("við"ri);
SUBSTITUTE (pr :0) (pr :1) ("við"ri) (-1C* CommVerb BARRIER CLB) (1C Human);

# "á" : 
#    0:"on"
#    1:"in"
#    1:"at"
SUBSTITUTE (pr) (pr :0) ("á"ri);
SUBSTITUTE (pr :0) (pr :1) ("á"ri) (1C ISLANDS OR LANGUAGES);
SUBSTITUTE (pr :0) (pr :2) ("á"ri) (1C BUILDINGS);

##
## PARTICLES
##

# "sem" :
#      0:"that"
#SUBSTITUTE (rel) (rel :0) ("sem"ri);

##
## ADJECTIVES 
## 

# "rómanskur" :
#            0:"Romance"
#            1:"Latin"
SUBSTITUTE (adj) (adj :0) ("rómanskur"ri);
SUBSTITUTE (adj :0) (adj :1) ("rómanskur"ri) (1C ("Ameríka"));

##
## ADVERBS
##
SUBSTITUTE ("allajafna") ("allajafna:1") ("allajafna" adv);
