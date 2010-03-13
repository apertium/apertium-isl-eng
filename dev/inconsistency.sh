TMPDIR=/tmp

lt-expand ../apertium-is-en.is.dix | grep -v '<prn><enc>' | grep -e ':<:' -e '\w:\w' | sed 's/:<:/%/g' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |
        apertium-pretransfer|
        apertium-transfer -n ../apertium-is-en.is-en.t0x  ../is-en.t0x.bin  |
        apertium-transfer ../apertium-is-en.is-en.t1x  ../is-en.t1x.bin  ../is-en.autobil.bin |
        apertium-interchunk ../apertium-is-en.is-en.t2x  ../is-en.t2x.bin |
        apertium-interchunk ../apertium-is-en.is-en.t3x  ../is-en.t3x.bin |
        apertium-postchunk ../apertium-is-en.is-en.t4x  ../is-en.t4x.bin  | tee $TMPDIR/tmp_testvoc2.txt |
        lt-proc -d ../is-en.autogen.bin > $TMPDIR/tmp_testvoc3.txt
paste -d _ $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc3.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g'

