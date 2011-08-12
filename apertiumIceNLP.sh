# This program assumes that IceNLPServer (the demonized version of IceNLP) is already running 
# The program relies on IceTagger to perform part-of-speech tagging and then runs the rest of the Apertium pipeline to finish the translation process
# The IceNLPCore environment variable needs to be set to the root directory of the IceNLPCore distribution
# The IceNLPServer environment variable needs to be set to the root directory of the IceNLPServer distribution
#
#  Flags:
# -t only perform PoS tagging
# -s run standard version of IceNLP instead of IceNLPServer
# -h make IceTagger run an HMM model as well

# Make sure we are in this Apertium directory
cd `dirname $0`

# Process command line arguments
while getopts "sth" flag
do
	#echo "$flag" $OPTIND $OPTARG
	if [ "$flag" = "s" ] ; then flagStandard=1 ; fi
	if [ "$flag" = "t" ] ; then flagOnlyTagging=1 ; fi
	if [ "$flag" = "h" ] ; then flagWithHMM=1 ; fi
done

hmmCommands=""

if [ -n "$flagWithHMM" ] ;
then
	hmmCommands="-m $IceNLPCore/ngrams/models/otb -mt startend"
fi

if [ -z "${IceNLPCore+xxx}" ] ;
then
	echo "The environment variable IceNLPCore is not set"
	exit;
fi

if [ -z "${IceNLPServer+xxx}" ] ;
then
	echo "The environment variable IceNLPServer is not set"
	exit;
fi

if [ -z "${apertium+xxx}" ] ;
then
	apertium="."
fi

#  Decrements the argument pointer so it points to next argument.
#  $1 now references the first non-option item supplied on the command-line
shift $(($OPTIND - 1))

# Set commands to be used below

# Apertium Morpho Analyzer. This is the first part of the pipeline
ltproc="lt-proc -w $apertium/is-en.automorf.bin"

# IceNLP that uses an external morpho analyzer
icenlpStandard="java -Xmx256M -classpath $IceNLPCore/dist/IceNLPCore.jar is.iclt.icenlp.runner.RunIceTaggerApertium -ner $hmmCommands -tm $IceNLPCore/dict/icetagger/otb.apertium.dict -x apertium -sf -of 2"

# IceNLP Server that uses the external morpho analyzer
icenlpServer="java -classpath $IceNLPServer/dist/IceNLPServer.jar is.iclt.icenlp.client.runner.Runner --port=1234 --host=localhost"

# The rest of the pipeline, this receives the tagged text and translates it
apertiumPipeline="cg-proc $apertium/is-en.rlx.bin |
cg-proc -n -w $apertium/is-en.lex.bin |
apertium-pretransfer | 
apertium-transfer -n $apertium/apertium-is-en.is-en.t0x $apertium/is-en.t0x.bin | 
apertium-transfer $apertium/apertium-is-en.is-en.t1x $apertium/is-en.t1x.bin $apertium/is-en.autobil.bin  | 
apertium-interchunk $apertium/apertium-is-en.is-en.t2x  $apertium/is-en.t2x.bin | 
apertium-interchunk $apertium/apertium-is-en.is-en.t3x  $apertium/is-en.t3x.bin | 
apertium-postchunk $apertium/apertium-is-en.is-en.t4x $apertium/is-en.t4x.bin | 
lt-proc -d $apertium/is-en.autogen.bin | 
lt-proc -p $apertium/is-en.autopgen.bin"

# This will take plain text and translate it
fullStandardPipeline=$ltproc" | "$icenlpStandard" | "$apertiumPipeline

# This will take plain text and output the tagging done by IceNLP
icemStandardPipeline=$ltproc" | "$icenlpStandard

# This will take plain text and translate it via the server
fullServerPipeline=$ltproc" | "$icenlpServer" | "$apertiumPipeline

# This will take plain text and output the tagging done by IceNLP via the server
icemServerPipeline=$ltproc" | "$icenlpServer

# We want to go through the standard pipeline
if [ -n "$flagStandard" ]
then
	if [ -n "$flagOnlyTagging" ]
	then
		command=$icemStandardPipeline
	else
		command=$fullStandardPipeline
	fi
else
	# Here we will go through the server pipeline
	if [ -n "$flagOnlyTagging" ]
	then
		command=$icemServerPipeline
	else
		command=$fullServerPipeline
	fi
fi

#echo $command
eval $command
