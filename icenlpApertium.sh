# This program assumes that IceNLPServer (the demonized version of IceNLP) is already running 
# The program relies on IceNLP to perform morphological analysis and tagging and then runs the rest of the Apertium pipeline to finish the translation process
# The ICENLP envirionment variable needs to be set to the root directory of IceNLP
#
#  Flags:
# -t only perform PoS tagging
# -s run standard version of IceNLP instead of IceNLPServer

# Make sure we are in this apertium directory
cd `dirname $0`

# Process command line arguments
while getopts "ts" flag
do
  #echo "$flag" $OPTIND $OPTARG
  if [ "$flag" = "t" ] ; then flagOnlyTagging=1 ;  fi
  if [ "$flag" = "s" ] ; then flagStandardIce=1 ;  fi
done

#  Decrements the argument pointer so it points to next argument.
#  $1 now references the first non-option item supplied on the command-line
shift $(($OPTIND - 1))

# Set commands to be used below
apertiumPipeline="cg-proc is-en.rlx.bin | cg-proc -n is-en.lex.bin | apertium-pretransfer | apertium-transfer -n apertium-is-en.is-en.t0x is-en.t0x.bin | apertium-transfer apertium-is-en.is-en.t1x  is-en.t1x.bin  is-en.autobil.bin  | apertium-interchunk apertium-is-en.is-en.t2x  is-en.t2x.bin | apertium-interchunk apertium-is-en.is-en.t3x is-en.t3x.bin | apertium-postchunk apertium-is-en.is-en.t4x is-en.t4x.bin | lt-proc -g is-en.autogen.bin | lt-proc -p is-en.autopgen.bin"

# apertiumPipeline="cg-proc is-en.rlx.bin"

standardIceNLP="java -Xmx768M -classpath $ICENLP/dist/IceNLPCore.jar is.iclt.icenlp.runner.RunIceTaggerApertium -tm $ICENLP/dict/icetagger/otb.apertium.dict -sf $1 $2 $3 $4 $5"

clientIceNLP="java -jar $ICENLP/tools/IceNLPClient/IceNLPClient.jar --host=localhost $1" 


# Execution
if [ -n "$flagStandardIce" ]  # Is the variable defined?
then
	if [ -n "$flagOnlyTagging" ]  # Is the variable defined?
	then
		command=$standardIceNLP
	else
		command=$standardIceNLP"|"$apertiumPipeline
	fi
else
	if [ -n "$flagOnlyTagging" ]  # Is the variable defined?
	then
		command=$clientIceNLP
	else
		command=$clientIceNLP"|"$apertiumPipeline
	fi
fi

eval $command
