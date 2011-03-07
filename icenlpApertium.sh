# This program assumes that IceNLPServer (the demonized version of IceNLP) is already running 
# The program relies on IceNLP to perform morphological analysis and tagging and then runs the rest of the Apertium pipeline to finish the translation process
# The IceNLPCore envirionment variable needs to be set to the root directory of the IceNLPCore distribution
# The IceNLPServer envirionment variable needs to be set to the root directory of the IceNLPServer distribution
#
#  Flags:
# -t only perform PoS tagging
# -c run tagging and constraint grammar
# -s run standard version of IceNLP instead of IceNLPServer
# -f run full pipeline but output tags into tagfile as well

# Make sure we are in this apertium directory
cd `dirname $0`

# Process command line arguments
while getopts "tscf" flag
do
  #echo "$flag" $OPTIND $OPTARG
  if [ "$flag" = "t" ] ; then flagOnlyTagging=1 ;  fi
  if [ "$flag" = "c" ] ; then flagCG=1 ;  fi
  if [ "$flag" = "s" ] ; then flagStandardIce=1 ;  fi
  if [ "$flag" = "f" ] ; then flagTagfile=1 ; fi
done

#  Decrements the argument pointer so it points to next argument.
#  $1 now references the first non-option item supplied on the command-line
shift $(($OPTIND - 1))

# Set commands to be used below
#apertiumdeformatter="apertium-destxt"
apertiumPipeline="cg-proc is-en.rlx.bin | cg-proc -n -w is-en.lex.bin | apertium-pretransfer | apertium-transfer -n apertium-is-en.is-en.t0x is-en.t0x.bin | apertium-transfer apertium-is-en.is-en.t1x  is-en.t1x.bin  is-en.autobil.bin  | apertium-interchunk apertium-is-en.is-en.t2x  is-en.t2x.bin | apertium-interchunk apertium-is-en.is-en.t3x is-en.t3x.bin | apertium-postchunk apertium-is-en.is-en.t4x is-en.t4x.bin | lt-proc -g is-en.autogen.bin | lt-proc -p is-en.autopgen.bin | apertium-retxt "

apertiumPipelineCG="cg-proc is-en.rlx.bin | cg-proc -n is-en.lex.bin" 

standardIceNLP="java -Xmx768M -classpath $IceNLPCore/dist/IceNLPCore.jar is.iclt.icenlp.runner.RunIceTaggerApertium -tm $IceNLPCore/dict/icetagger/otb.apertium.dict -sf -mt end"

clientIceNLP="$IceNLPServer/sh/RunClient.sh $1 | $IceNLPServer/sh/apertium-destxt.sh"

tagOutput="tee $1" ## filename for tag output is first argument after -f flag


# Execution
if [ -n "$flagStandardIce" ]  # Is the standard IceNLP variable defined?
then
	if [ -n "$flagOnlyTagging" ]  # Is the tagging only variable defined?
	then
		command=$standardIceNLP
		if [ -n "$flagCG" ]  # Is the constraint grammar variable defined?
		then
			command= $standardIceNLP" | "$apertiumPipelineCG
		fi
	else
		command=$standardIceNLP" | "$apertiumPipeline
	fi
else
	if [ -n "$flagOnlyTagging" ]  # Is the tagging only variable defined?
	then
		command=$clientIceNLP
		if [ -n "$flagCG" ]  # Is the constraint grammar variable defined?
		then
			command=$clientIceNLP" | "$apertiumPipelineCG
		fi
	else
		if [ -n "$flagTagfile" ]  # Is the tagfile variable defined?
		then
			#echo "Tagfile variable is set."
			command=$clientIceNLP" | "$tagOutput" | "$apertiumPipeline
		else
			#echo "Tagfile variable is NOT set."
			#command=$apertiumdeformatter" | "$clientIceNLP" | "$apertiumPipeline
			command=$clientIceNLP" | "$apertiumPipeline
		fi
	fi
fi

#echo $command
eval $command
