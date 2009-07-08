IceNLP_Path=~/nlp/java/IceNLP
java -Xmx768M -classpath $IceNLP_Path/dist/IceNLPCore.jar:$IceNLP_Path/lib/Lemmatizer.jar is.ru.cs.nlp.icenlp.runner.RunIceTaggerApertium -tm $IceNLP_Path/dict/icetagger/otb.apertium.dict -ls $IceNLP_Path/dict/lemmald/settings.txt $1 $2 
