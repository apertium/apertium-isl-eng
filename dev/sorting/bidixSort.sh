## This script is for semi-manually sorting sections of the Apertium bidix.
## First copy a section of the bidix to be sorted into a temp file,
## then run this script on the temp file and re-insert into bidix.
##
## Author:  Martha Dís Brandt
## Date:  Dec.14 2009

# Remove comment start tag and add pseudo text at end of line:
sed -e 's/^ *<!--//g' -e 's/>-->$/>--> COMMENT/g' $1 > $1.pseudo
# Sort alphabetically, ignoring leading blanks:
sort -b $1.pseudo -o $1.sorted
# Restore the comment start tag:
sed -e 's/^<e>/<!--/g' -e 's/>--> COMMENT$/>-->/g' $1.sorted > $1.restored
