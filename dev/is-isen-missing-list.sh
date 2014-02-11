cat apertium-is-en.is-en.dix | grep '<e' | grep -v '<!' |sed 's/<\/l>/@/g' | cut -f1 -d'@' | sed 's/^[ \t]*//g' | sort -u  > /tmp/bidix
cat /tmp/bidix | sed 's/<l>/@/g' | cut -f2 -d'@' | cut -f1 -d'<' | lt-proc is-en.automorf.bin  > /tmp/analysed
paste /tmp/bidix /tmp/analysed | grep '\*' 
