DELIMITERS            = (sent) (".");
SOFT-DELIMITERS       = ("<,>") ;

LIST BOS              = (>>>);
LIST EOS              = (<<<);

LIST PrnPos           = (prn pos);

SECTION

SUBSTITUTE (n) (n :0) ("bóndi"ri);
SUBSTITUTE (n :0) (n :1) ("bóndi"ri) (1C PrnPos);
