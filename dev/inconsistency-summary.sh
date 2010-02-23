POS="abbr adj adj adv cm cnjadv cnjcoo cnjsub det guio ij n np num pr preadv prn rel vaux vbhaver vblex vbser"
INC=$1

echo -e "POS\tTotal\tClean\tWith @\tWith #";
for i in $POS; do
	TOTAL=`cat $INC | grep "<$i>" | wc -l`;
	AT=`cat $INC | grep "<$i>" | grep '@'  | wc -l`;
	HASH=`cat $INC | grep "<$i>" | grep '>  *#' | wc -l`;
	UNCLEAN=`calc $AT+$HASH`;
	CLEAN=`calc $TOTAL-$UNCLEAN`;

	echo -e $i"\t"$TOTAL"\t"$CLEAN"\t"$AT"\t"$HASH;
done
