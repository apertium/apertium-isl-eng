DELIMITERS            = (sent) (".");
SOFT-DELIMITERS       = ("<,>") ;

LIST BOS              = (>>>);
LIST EOS              = (<<<);

LIST CommVerb         = "tala" "segja" "mæla" "yrða" "spjalla" "kveða" "segja";
LIST Human            = (np ant) (np cog) (prn p2) (prn p3 m) (prn p3 f) ("enginn"ri prn ind);

LIST Islands          = "England" "Ísland" ;

LIST PrnPos           = (prn pos);
LIST PrnPersAnim      = (prn p1) (prn p2) (prn p3 m) (prn p3 f);
LIST Ord              = (ord) ("fyrstur"ri);

LIST Acc              = (acc);
LIST Gen              = (gen);
LIST Dat              = (dat);

SECTION

##
## NOUNS 
##

# "bóndi" : "farmer"
SUBSTITUTE (n) (n :0) ("bóndi"ri);

# "bóndi" : "husband"
SUBSTITUTE (n :0) (n :1) ("bóndi"ri) (1C PrnPos OR PrnPersAnim + Gen);

# "drottinn" : "king"
SUBSTITUTE (n) (n :0) ("drottinn"ri);

# "drottinn" : "lord"
SUBSTITUTE (n :0) (n :1) ("drottinn"ri) (1C ("Guð"));

# "sæti" : "seat"
SUBSTITUTE (n) (n :0) ("sæti"ri);

# "sæti" : "place"
SUBSTITUTE (n :0) (n :1) ("sæti"ri) (-1C Ord);

##
## VERBS
##

# "skipa" : "order"
SUBSTITUTE (vblex) (vblex :0) ("skipa"ri);

# "skipa" : "appoint"
SUBSTITUTE (vblex :0) (vblex :1) ("skipa"ri) (1C Acc);

# "lýsa" : "show"
SUBSTITUTE (vblex) (vblex :0) ("lýsa"ri);

# "lýsa" : "light"
SUBSTITUTE (vblex :0) (vblex :1) ("lýsa"ri) (1C Acc);

## 
## PREPOSITIONS 
##

# "við" : "beside"
SUBSTITUTE (pr) (pr :0) ("við"ri);

# "við" : "to"
SUBSTITUTE (pr :0) (pr :1) ("við"ri) (-1C* CommVerb) (1C Human);

# "á" : "on"
SUBSTITUTE (pr) (pr :0) ("á"ri);

# "á" : "in"
SUBSTITUTE (pr :0) (pr :1) ("á"ri) (1C Islands);
