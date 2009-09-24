echo
echo "Input:"
echo $1

echo
echo "Tagging results:"
echo $1 | ./icetaggerApertium.sh $1

echo
echo "Transfer rules:"
echo $1 | ./icetaggerApertium.sh $1 | apertium-pretransfer | apertium-transfer apertium-is-en.is-en.t1x  is-en.t1x.bin  is-en.autobil.bin  | apertium-interchunk apertium-is-en.is-en.t2x  is-en.t2x.bin

echo
echo "Post-transfer:"
echo $1 | ./icetaggerApertium.sh $1 | apertium-pretransfer | apertium-transfer apertium-is-en.is-en.t1x  is-en.t1x.bin  is-en.autobil.bin  | apertium-interchunk apertium-is-en.is-en.t2x  is-en.t2x.bin | apertium-postchunk apertium-is-en.is-en.t3x  is-en.t3x.bin

echo
echo "Generated translation:"
echo $1 | ./icetaggerApertium.sh $1 | apertium-pretransfer | apertium-transfer apertium-is-en.is-en.t1x  is-en.t1x.bin  is-en.autobil.bin  | apertium-interchunk apertium-is-en.is-en.t2x  is-en.t2x.bin | apertium-postchunk apertium-is-en.is-en.t3x  is-en.t3x.bin  |lt-proc -d is-en.autogen.bin | lt-proc -p is-en.autopgen.bin
echo
echo
