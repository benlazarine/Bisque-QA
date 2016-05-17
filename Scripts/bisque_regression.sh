#!/bin/bash


##  Setup the ENV var for correct environment to run the testsuites against
#if [ "`echo $1 | tr [:upper:] [:lower:]`" = "beta" ]; then
#	echo Matched AtmoBeta
#	ENV=Beta
#elif [ "`echo $1 | tr [:upper:] [:lower:]`" = "prod" ]; then
#	echo Matched AtmoProd
#	ENV=Prod
#elif [ "`echo $1 | tr [:upper:] [:lower:]`" = "all" ]; then
#	echo Matched All
#	ENV=All
#else
#	echo "Didn't recognize environment passed in. Please try again"
#	echo
#	echo "Here is what I got [$1]"
#	echo
#	echo "Should be one of the following:"
#	echo "   beta   prod"
#	echo
#	exit
#fi




#  If smoke parameter is passed in to run ONLY smoke tests
if [ "`echo $1 | tr [:upper:] [:lower:]`" = "smoke" ]; then
	echo Matched Smoke
	Smoke='-i smoke'
fi


# Change to the directory where testsuites are stored
cd $HOME/trunk/Bisque


# Verify that output and downloads directories exist, create if they don't, clean out if they do
#if [ ! -d $HOME/junk/CleanUp ]; then
#	mkdir -p $HOME/junk/CleanUp
#else
#	rm -rf $HOME/junk/CleanUp/*
#fi
if [ ! -d $HOME/trunk/Bisque/downloads ]; then
	mkdir -p $HOME/trunk/Bisque/downloads
else
	rm -rf $HOME/trunk/Bisque/downloads/*
fi
if [ ! -d $HOME/junk/RegressionTests_Bisque ]; then
	mkdir -p $HOME/junk/RegressionTests_Bisque
else
	rm -rf $HOME/junk/RegressionTests_Bisque/*
fi


##  Checkout the code for a specific branch based on environment running in
cd $HOME/trunk/Bisque
git checkout master
git pull
cd $HOME/trunk/iPlant-TestData
git checkout master
git pull


#  Verify that vars file is available
if [ ! -r $HOME/trunk/BisqueVars.txt ]; then
	echo "*******************************************"
	echo "* * *  Missing BisqueVars.txt file  * * *"
	exit
fi


#  Run the cleanup and regression suites
cd $HOME/trunk/Bisque
pybot -A ../BisqueVars.txt --name CleanUp $Smoke -d $HOME/junk/RegressionTests_Bisque/ -o Cleanup-Output.xml Cleanup/Cleanup_Suite.robot
pybot -A ../BisqueVars.txt --name API $Smoke -d $HOME/junk/RegressionTests_Bisque/ -o API-Output.xml -A Bisque_Tests_API.list
pybot -A ../BisqueVars.txt --name FireFox $Smoke -d $HOME/junk/RegressionTests_Bisque/ --variable SShotBase:FireFox --variable Browser:ff -o FireFox-Output.xml -A Bisque_Tests_GUI.list
pybot -A ../BisqueVars.txt --name Chrome $Smoke -d $HOME/junk/RegressionTests_Bisque/ --variable SShotBase:Chrome --variable Browser:chrome -o Chrome-Output.xml -A Bisque_Tests_GUI.list


#  Check for all the xml files to be present
if [ ! -r $HOME/junk/RegressionTests_Bisque/Cleanup-Output.xml ]; then
	echo "- - -  Missing Cleanup-Output.xml file"
fi
if [ ! -r $HOME/junk/RegressionTests_Bisque/API-Output.xml ]; then
	echo "- - -  Missing API-Output.xml file"
fi
if [ ! -r $HOME/junk/RegressionTests_Bisque/FireFox-Output.xml ]; then
	echo "- - -  Missing FireFox-Output.xml file"
fi
if [ ! -r $HOME/junk/RegressionTests_Bisque/Chrome-Output.xml ]; then
	echo "- - -  Missing Chrome-Output.xml file"
fi
# Now combine all the results into one report
cd $HOME/junk/RegressionTests_Bisque
#	[ -r $HOME/junk/RegressionTests_Bisque/DB-Output.xml ] && \
#	$HOME/junk/RegressionTests_Bisque/DB-Output.xml \
if [ -r $HOME/junk/RegressionTests_Bisque/Cleanup-Output.xml ] && \
	[ -r $HOME/junk/RegressionTests_Bisque/API-Output.xml ] && \
	[ -r $HOME/junk/RegressionTests_Bisque/FireFox-Output.xml ] && \
	[ -r $HOME/junk/RegressionTests_Bisque/Chrome-Output.xml ] ; then
	echo "--------------------------------------------------------------------------"
	echo "- - -   Combining output.xml files from Cleanup and Regression run"
	echo "--------------------------------------------------------------------------"
	rebot --name Bisque_Regression -n BISQUE-* -n QA-* \
	    $HOME/junk/RegressionTests_Bisque/Cleanup-Output.xml \
		$HOME/junk/RegressionTests_Bisque/API-Output.xml \
		$HOME/junk/RegressionTests_Bisque/FireFox-Output.xml \
		$HOME/junk/RegressionTests_Bisque/Chrome-Output.xml
else
	echo "************************************************************"
	echo "* * *   output.xml file missing, no report generated   * * *"
	echo "************************************************************"
fi
