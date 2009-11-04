$ echo "stór hundur" | lt-proc is-en.automorf.bin

$ echo "stór hundur" | lt-proc is-en.automorf.bin | apertium-tagger -g
is-en.prob

$ echo "stór hundur" | lt-proc is-en.automorf.bin | apertium-tagger -g
is-en.prob | apertium-pretransfer

$ echo "stór hundur" | lt-proc is-en.automorf.bin | apertium-tagger -g
is-en.prob | apertium-pretransfer | apertium-transfer
apertium-is-en.is-en.t1x  is-en.t1x.bin  is-en.autobil.bin

$ echo "stór hundur" | lt-proc is-en.automorf.bin | apertium-tagger -g
is-en.prob | apertium-pretransfer | apertium-transfer
apertium-is-en.is-en.t1x  is-en.t1x.bin  is-en.autobil.bin  |
apertium-interchunk apertium-is-en.is-en.t2x  is-en.t2x.bin

$ echo "stór hundur" | lt-proc is-en.automorf.bin | apertium-tagger -g
is-en.prob | apertium-pretransfer | apertium-transfer
apertium-is-en.is-en.t1x  is-en.t1x.bin  is-en.autobil.bin  |
apertium-interchunk apertium-is-en.is-en.t2x  is-en.t2x.bin |
apertium-postchunk apertium-is-en.is-en.t3x  is-en.t3x.bin

$ echo "stór hundur" | lt-proc is-en.automorf.bin | apertium-tagger -g
is-en.prob | apertium-pretransfer | apertium-transfer
apertium-is-en.is-en.t1x  is-en.t1x.bin  is-en.autobil.bin  |
apertium-interchunk apertium-is-en.is-en.t2x  is-en.t2x.bin |
apertium-postchunk apertium-is-en.is-en.t3x  is-en.t3x.bin  | lt-proc -d
is-en.autogen.bin

echo "stór hundur" | lt-proc is-en.automorf.bin | apertium-tagger -g is-en.prob | apertium-pretransfer | apertium-transfer apertium-is-en.is-en.t1x  is-en.t1x.bin  is-en.autobil.bin  | apertium-interchunk apertium-is-en.is-en.t2x  is-en.t2x.bin | apertium-postchunk apertium-is-en.is-en.t3x  is-en.t3x.bin  |lt-proc -d is-en.autogen.bin | lt-proc -p is-en.autopgen.bin

//shortcuts:
$ echo "Stóri hundurinn" | apertium -d . is-en-chunker
$ echo "Stóri hundurinn" | apertium -d . is-en-interchunk
$ echo "Stóri hundurinn" | apertium -d . is-en-postchunk
