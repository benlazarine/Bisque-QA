#!/bin/bash


#if [ "$1" == "" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
#   echo .
#   echo "Not enough parameters passed in"
#   echo "usage is:"
#   echo "    `basename $0` <Environment>"
#   echo .
#   echo "     `basename $0` beta"
#   echo .
#   exit
#fi

#echo -n Testing
#echo -n without linefeeds

##  Setup the ENV var for correct environment to run the testsuites against
#if [ "`echo $1 | tr [:upper:] [:lower:]`" = "prod" ]; then
#	echo Matched Bisque
#	ENV=Prod
#elif [ "`echo $1 | tr [:upper:] [:lower:]`" = "beta" ]; then
#	echo Matched Bisque
#	ENV=Beta
#else
#	echo "Didn't recognize environment passed in. Please try again"
#	echo
#	echo "Here is what I got [$1]"
#	echo
#    echo "Should be one of the following:"
#    echo "   beta   prod"
#    echo
#	exit
#fi


#DateDir=$(date -jn +%F | sed s/-//g)
DateDir=$(date +%F | sed s/-//g)


cd $HOME/trunk/Bisque


sftp -oPort=1657 -b - qa-4.iplantcollaborative.org <<END
-mkdir incoming
-mkdir incoming/$DateDir
-cd incoming/$DateDir
-put $HOME/junk/RegressionTests_Bisque/*.html
-put $HOME/junk/RegressionTests_Bisque/*.xml
-put $HOME/junk/RegressionTests_Bisque/*.png
END


echo "Files should now be uploaded to QA-4"


##  Check if RF script exists as a symbolic link in $HOME/bin/
#if [ ! -h $HOME/bin/RF_ResultsDB_Add.sh ]; then
#	echo "Creating symlink for RF_ResultsDB_Add.sh file"
#	ln -sf $HOME/trunk/robotframework/misc/Jerry/RF_ResultsDB_Add.sh $HOME/bin/
#fi
#
#
##  Now let's updated the SQLite databases
##time RF_ResultsDB_Add.sh $1
#if [ "$ENV" == "Prod" ]; then
#	RF_ResultsDB_Add.sh atmoprod
#elif [ "$ENV" == "Beta" ]; then
#	RF_ResultsDB_Add.sh atmobeta
#else
#	echo "got an unrecognized env passed in"
#fi

