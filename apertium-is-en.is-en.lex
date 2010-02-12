DELIMITERS            = (sent) (".") ;
SOFT-DELIMITERS       = ("<,>") ;

LIST BOS              = (>>>);
LIST EOS              = (<<<);


LIST PrnPos           = (prn pos);
LIST PrnPersAnim      = (prn p1) (prn p2) (prn p3 m) (prn p3 f);
LIST Ord              = (ord) ("fyrstur"ri);
LIST Num              = (num) ("milljarður"ri) ("þúsund"ri);

LIST Acc              = (acc);
LIST Gen              = (gen);
LIST Dat              = (dat);

LIST CommVerb         = "tala" "segja" "mæla" "yrða" "spjalla" "kveða" "segja";
LIST Human            = (np ant) (np cog) (prn p2) (prn p3 m) (prn p3 f) ("enginn"ri prn ind);

LIST Islands          = "England" "Ísland" "Kúba" "Haítí" "Kanarí" "Kanaríeyjar"; 

LIST @N→              = @N→;
LIST @←N              = @←N;
LIST @SUBJ→           = @SUBJ→;
LIST @←SUBJ           = @←SUBJ;

SECTION

##
## NOUNS 
##

# "bóndi" : 
#        0:"farmer"
#        1:"husband"
SUBSTITUTE (n) (n :0) ("bóndi"ri);
SUBSTITUTE (n :0) (n :1) ("bóndi"ri) (1C PrnPos OR PrnPersAnim + Gen);

# "drottinn" : 
#           0:"king"
#           1:"lord"
SUBSTITUTE (n) (n :0) ("drottinn"ri);
SUBSTITUTE (n :0) (n :1) ("drottinn"ri) (1C ("Guð"));

# "sæti" : 
#       0:"seat"
#       1:"place"
SUBSTITUTE (n) (n :0) ("sæti"ri);
SUBSTITUTE (n :0) (n :1) ("sæti"ri) (-1C Ord);

# "rektor" :
#         0:"vice chancellor"
#         1:"headmaster"
SUBSTITUTE (n) (n :0) ("rektor"ri);

# "bakki"  :
#         0:"tray"
#         1:"bank" [river]
SUBSTITUTE (n) (n :0) ("bakki"ri);

# "aðgerð" :
#         0:"operation"
#         1:"measures"
#         2:"repairs"
SUBSTITUTE (n) (n :0) ("aðgerð"ri);
SUBSTITUTE (n :0) (n :1) ("aðgerð"ri) (0 ("<aðgerða>"ri)) (-1 ("grípa# til"ri));

# "dalur" :
#        0:"valley"
#        1:"dollar"
SUBSTITUTE (n) (n :0) ("dalur"ri);
SUBSTITUTE (n :0) (n :1) ("dalur"ri) (-1 Num);

# "himinn" :
#        0:"sky"
#        1:"heaven"
SUBSTITUTE (n) (n :0) ("himinn"ri);
SUBSTITUTE (n :0) (n :1) ("himinn"ri) (1 ("og"ri)) (2 ("jörð"ri)); # í upphafi

# "land" :
#        0:"land"
#        1:"country"
SUBSTITUTE (n) (n :0) ("land"ri);
SUBSTITUTE (n :0) (n :1) ("land"ri) ((1 @←N) OR (-1 @N→));


##
## VERBS
##

# "skipa" : 
#        0:"order"
#        1:"appoint"
SUBSTITUTE (vblex) (vblex :0) ("skipa"ri);
SUBSTITUTE (vblex :0) (vblex :1) ("skipa"ri) (1C Acc);

# "lýsa" : 
#       0:"show"
#       1:"light"
SUBSTITUTE (vblex) (vblex :0) ("lýsa"ri);
SUBSTITUTE (vblex :0) (vblex :1) ("lýsa"ri) (1C Acc);

# "greiða" : 
#       0:"pay"
#       1:"comb"
SUBSTITUTE (vblex) (vblex :0) ("greiða"ri);
#SUBSTITUTE (vblex :0) (vblex :1) ("greiða"ri) (1C Dat);

# "leggja" : 
#       0:"lay"
#       1:"park"
SUBSTITUTE (vblex) (vblex :0) ("leggja"ri);
SUBSTITUTE (vblex :0) (vblex :1) ("leggja"ri) (1C Dat);

# "þýða" : 
#       0:"mean"
#       1:"translate"
SUBSTITUTE (vblex) (vblex :0) ("þýða"ri);

# "batna" : 
#        0:"improve"
#        1:"get# better"
SUBSTITUTE (vblex) (vblex :0) ("batna"ri);
SUBSTITUTE (vblex :0) (vblex :1) ("batna"ri) ((-1C* @SUBJ→ + Dat) OR (1C* @←SUBJ + Dat));

# "halda" : 
#        0:"hold"
#        1:"think"
SUBSTITUTE (vblex) (vblex :0) ("halda"ri);
SUBSTITUTE (vblex :0) (vblex :1) ("halda"ri) (1 ("að"));




## 
## PREPOSITIONS 
##

# "við" : 
#      0: "with"
#      1: "to"
#      2: "beside"
SUBSTITUTE (pr) (pr :0) ("við"ri);
SUBSTITUTE (pr :0) (pr :1) ("við"ri) (-1C* CommVerb) (1C Human);

# "á" : 
#    0:"on"
#    1:"in"
SUBSTITUTE (pr) (pr :0) ("á"ri);
SUBSTITUTE (pr :0) (pr :1) ("á"ri) (1C Islands);

##
## PARTICLES
##

# "sem" :
#      0:"that"
SUBSTITUTE (rel) (rel :0) ("sem"ri);

##
## ADJECTIVES 
## 

# "rómanskur" :
#            0:"Romance"
#            1:"Latin"
SUBSTITUTE (adj) (adj :0) ("rómanskur"ri);
SUBSTITUTE (adj :0) (adj :1) ("rómanskur"ri) (1C ("Ameríka"));
