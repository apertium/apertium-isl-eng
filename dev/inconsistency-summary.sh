POS="abbr adj adv cm cnjadv cnjcoo cnjsub det guio ij n np num pr preadv prn rel vaux vbhaver vblex vbser"
INC=$1

echo -e "POS\tTotal\tClean\tWith @\tWith #\tClean %"
for i in $POS; do
	TOTAL=`cat $INC | grep "<$i>" | wc -l`;
	AT=`cat $INC | grep "<$i>" | grep '@'  | wc -l`;
	HASH=`cat $INC | grep "<$i>" | grep '>  *#' | wc -l`;
	UNCLEAN=`calc $AT+$HASH`;
	CLEAN=`calc $TOTAL-$UNCLEAN`;
	PERCLEAN=`calc $UNCLEAN/$TOTAL*100 |sed 's/^\W*//g' | sed 's/~//g' | head -c 5`;
	echo $PERCLEAN | grep "Err" > /dev/null;
	if [ $? -eq 0 ]; then
		PERCLEAN="100";
	fi

	echo -e $TOTAL";"$i";"$CLEAN";"$AT";"$HASH";"$PERCLEAN;
done | sort -gr | awk -F';' '{print $2"\t"$1"\t"$3"\t"$4"\t"$5"\t"$6}'
