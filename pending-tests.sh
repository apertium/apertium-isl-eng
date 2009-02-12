LIST=`wget -O - -q http://wiki.apertium.org/wiki/Icelandic_and_English/Pending_tests | grep '<li>' | sed 's/<.*li>//g' | sed 's/ /_/g'`;

#cp *.mode modes/
basedir=`pwd`

for LINE in $LIST; do
	dir=`echo $LINE | cut -f2 -d'(' | cut -f1 -d')'`;

	if [ $dir = "is" ]; then
		mode="is-en";
	elif [ $dir = "en" ]; then
		mode="en-is";
	else 
		continue;
	fi

#	echo $LINE;
	SL=`echo $LINE | cut -f2 -d')' | sed 's/<i>//g' | sed 's/<\/i>//g' | cut -f2 -d'*' | sed 's/→/@/g' | cut -f1 -d'@' | sed 's/(note:/@/g' | sed 's/_/ /g'`;
	TL=`echo $LINE | sed 's/(\w\w)//g' | sed 's/<i>//g' | cut -f2 -d'*' | sed 's/<\/i>_→/@/g' | cut -f2 -d'@' | sed 's/_/ /g' | sed 's/^ *//g' | sed 's/ *$//g'`;
	
	TRANS=`echo $SL | apertium -d $basedir $mode | sed 's/^ *//g' | sed 's/ *$//g'`;

	if [[ $TL != $TRANS ]]; then
		echo -e $mode"\t "$SL"\n\t- $TL\n\t+ "$TRANS"\n";
	else
		echo -e $mode"\t "$SL"\nWORKS\t  $TL\n";
	fi

done
