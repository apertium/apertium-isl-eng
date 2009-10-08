DELIMITERS            = (sent) (".");
SOFT-DELIMITERS       = ("<,>") ;

LIST BOS              = (>>>);
LIST EOS              = (<<<);

LIST PrnPos           = (prn pos);

SECTION

# "bóndi" : "farmer"
SUBSTITUTE (n) (n :0) ("bóndi"ri);

# "bóndi" : "husband"
SUBSTITUTE (n :0) (n :1) ("bóndi"ri) (1C PrnPos);
