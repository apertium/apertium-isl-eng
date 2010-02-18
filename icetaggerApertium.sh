IceNLP_Path=~/nlp/java/IceNLP
java -Xmx768M -classpath $IceNLP_Path/dist/IceNLPCore.jar is.iclt.icenlp.runner.RunIceTaggerApertium -tm $IceNLP_Path/dict/icetagger/otb.apertium.dict -sf $1 $2 $3 $4 $5
