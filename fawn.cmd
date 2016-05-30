@Echo OFF

REM ===============================================================

REM	fawn: Force.com Ant Wrapper Navigator

REM © Fabrice Cathala - 14 May 2016

REM ===============================================================

	REM faw setup parameters
	Call fawn.config.cmd

	REM Orgs connections information
	Call fawn.orgs.cmd

	REM Change Set names
	Call fawn.pkg.cmd

REM ===============================================================

	REM Common parameters
	Set BLUE=1B
	Set RED=4F
	Set AMBER=6E
	Set GREEN=2A

REM ===============================================================

:Orgs
	Cls
	Color %BLUE%

	Echo.
	Echo = Connect to organisation...
	Echo ==========================================================
	Echo.
	Echo - 0 ......... %ORG0%
	Echo.
	Echo - 1 ......... %ORG1%
	Echo.
	Echo - 2 ......... %ORG2%
	Echo.
	Echo - 3 ......... %ORG3%
	Echo.
	Echo - 4 ......... %ORG4%
	Echo.
	Echo - 5 ......... %ORG5%
	Echo.
	Echo - 6 ......... %ORG6%
	Echo.
	Echo - 7 ......... %ORG7%
	Echo.
	Echo - 8 ......... %ORG8%
	Echo.
	Echo - 9 ......... %ORG9%
	Echo.
	Echo.
	Echo - D ......... Debug Setup
	Echo - Q ......... Quit
	Echo.

Set Selection=
	Set /P Selection=Type your selection AND PRESS ENTER:
	If NOT '%Selection%'=='' SET Selection=%Selection:~0,1%
	If /I '%Selection%'==''  GOTO Orgs
	If /I '%Selection%'=='0' GOTO Org0
	If /I '%Selection%'=='1' GOTO Org1
	If /I '%Selection%'=='2' GOTO Org2
	If /I '%Selection%'=='3' GOTO Org3
	If /I '%Selection%'=='4' GOTO Org4
	If /I '%Selection%'=='5' GOTO Org5
	If /I '%Selection%'=='6' GOTO Org6
	If /I '%Selection%'=='7' GOTO Org7
	If /I '%Selection%'=='8' GOTO Org8
	If /I '%Selection%'=='9' GOTO Org9
	If /I '%Selection%'=='D' GOTO DebugSetup
	If /I '%Selection%'=='Q' GOTO End
	Goto End

:Org0
	Set NUM=0
	Set ORG=%ORG0%
	Set USR=%USR0%
	Set PWD=%PWD0%
	Set URL=%URL0%
	Goto Action

:Org1
	Set NUM=1
	Set ORG=%ORG1%
	Set USR=%USR1%
	Set PWD=%PWD1%
	Set URL=%URL1%
	Goto Action

:Org2
	Set NUM=2
	Set ORG=%ORG2%
	Set USR=%USR2%
	Set PWD=%PWD2%
	Set URL=%URL2%
	Goto Action

:Org3
	Set NUM=3
	Set ORG=%ORG3%
	Set USR=%USR3%
	Set PWD=%PWD3%
	Set URL=%URL3%
	Goto Action

:Org4
	Set NUM=4
	Set ORG=%ORG4%
	Set USR=%USR4%
	Set PWD=%PWD4%
	Set URL=%URL4%
	Goto Action

:Org5
	Set NUM=5
	Set ORG=%ORG5%
	Set USR=%USR5%
	Set PWD=%PWD5%
	Set URL=%URL5%
	Goto Action

:Org6
	Set NUM=6
	Set ORG=%ORG6%
	Set USR=%USR6%
	Set PWD=%PWD6%
	Set URL=%URL6%
	Goto Action

:Org7
	Set NUM=7
	Set ORG=%ORG7%
	Set USR=%USR7%
	Set PWD=%PWD7%
	Set URL=%URL7%
	Goto Action

:Org8
	Set NUM=8
	Set ORG=%ORG8%
	Set USR=%USR8%
	Set PWD=%PWD8%
	Set URL=%URL8%
	Goto Action

:DebugSetup
	Cls
	Echo.
	Echo = Debug Information
	Echo ==========================================================
	Call %ANT_HOME%\bin\ant.bat -version -logfile %LOGFolder%\debug-setup.log
	Call %ANT_HOME%\bin\ant.bat -p build.xml -logfile %LOGFolder%\debug-build.log
	Echo.>>%LOGFolder%\debug-setup.log
	Type %LOGFolder%\debug-build.log >> %LOGFolder%\debug-setup.log
	Echo.>>%LOGFolder%\debug-setup.log
	Echo JAVA (should be initialised on the JDK and not the JRE):>>%LOGFolder%\debug-setup.log
	Echo %JAVA_HOME%>>%LOGFolder%\debug-setup.log
	Echo ANT (Should be set):>>%LOGFolder%\debug-setup.log
	Echo %ANT_HOME%>>%LOGFolder%\debug-setup.log
	Echo.>>%LOGFolder%\debug-setup.log
	Echo PATHEXT (.BAT should come before .CMD):>>%LOGFolder%\debug-setup.log
	Echo %PATHEXT%>>%LOGFolder%\debug-setup.log
	Echo.>>%LOGFolder%\debug-setup.log
	Echo PATH (should include JAVA JDK /bin and ANT /bin):>>%LOGFolder%\debug-setup.log
	Echo %PATH%>>%LOGFolder%\debug-setup.log
	Echo.>>%LOGFolder%\debug-setup.log
	Type %LOGFolder%\debug-setup.log
	Pause
	Goto Orgs

REM ===============================================================

:Action
	Cls
	Color %AMBER%

	Echo.
	Echo Select the command to run on %ORG% (%NUM%)
	Echo ==========================================================
	Echo.
	Echo - 1 ......... Retrieve a package from %ORG%
	Echo.
	Echo - 2 ......... Retrieve an XML Components List from %ORG%
	Echo.
	Echo - 3 ......... Check the package on %ORG%
	Echo.
	Echo - 4 ......... Deploy the package on %ORG%
	Echo.
	Echo - 5 ......... Copy the package to the %VCSFolder%
	Echo.
	Echo - 6 ......... Commit the changes to the VCS 
	Echo.
	Echo - 7 ......... List the metadata components
	Echo.
	Echo.
	Echo - 8 ......... Undeploy to %ORG%
	Echo.
	Echo.
	Echo - D ......... Debug batch file
	Echo - B ......... Back
	Echo - Q ......... Quit
	Echo.

Set Selection=
	Set /P Selection=Type your selection AND PRESS ENTER:
	If NOT '%Selection%'=='' SET Selection=%Selection:~0,1%
	If /I '%Selection%'==''  GOTO Action

	If /I '%Selection%'=='1' GOTO SelectPKG
	If /I '%Selection%'=='2' GOTO RetrieveXML
	If /I '%Selection%'=='3' GOTO CheckOnly
	If /I '%Selection%'=='4' GOTO Deploy
	If /I '%Selection%'=='5' GOTO Transport
	If /I '%Selection%'=='6' GOTO Commit
	If /I '%Selection%'=='7' GOTO Metadata
	If /I '%Selection%'=='8' GOTO Undeploy
	If /I '%Selection%'=='D' GOTO DebugBatch
	If /I '%Selection%'=='B' GOTO Orgs
	If /I '%Selection%'=='Q' GOTO End
	Goto End

REM ===============================================================


:RetrieveXML
	Cd %ANTFolder%
	Del %LOGFolder%\retrieve-XML.log
	Call %ANT_HOME%\bin\ant.bat -Dsf.usr=%USR% -Dsf.pwd=%PWD% -Dsf.url=%URL% -logfile %LOGFolder%\retrieve-XML.log retrieveXML
	Type %LOGFolder%\retrieve-XML.log
	Echo.
	Pause
	Goto Action

:CheckOnly
	Cd %ANTFolder%
	Del %LOGFolder%\check-%NUM%.log
	Call %ANT_HOME%\bin\ant.bat -Dsf.usr=%USR% -Dsf.pwd=%PWD% -Dsf.url=%URL% -logfile %LOGFolder%\check-%NUM%.log checkOnly
	Type %LOGFolder%\check-%NUM%.log
	Echo.
	Pause
	Goto Action

:Deploy
	Cd %ANTFolder%
	Del %LOGFolder%\deploy-%NUM%.log
	Call %ANT_HOME%\bin\ant.bat -Dsf.usr=%USR% -Dsf.pwd=%PWD% -Dsf.url=%URL% -logfile %LOGFolder%\deploy-%NUM%.log deploy
	Type %LOGFolder%\deploy-%NUM%.log
	Echo.
	Pause
	Goto Action

:Transport
	XCopy %ANTFolder%\src %VCSFolder%\src /s /y
	Echo.
	Pause
	Goto Action

:Commit
	REM Work in Progress
	Cd %VCSFolder%\src
	Git Status
	REM feature/VPM-MVP
	Echo.
	Pause
	Goto Command

:Metadata
	Cd %ANTFolder%
	Call %ANT_HOME%\bin\ant.bat list
	Echo.
	Pause
	Goto Command

:Undeploy
	Cd %ANTFolder%
	Call %ANT_HOME%\bin\ant.bat undeploy
	Echo.
	Pause
	Goto Action

:DebugBatch
	Cls
	Echo.
	Echo = Debug Information
	Echo ==========================================================
	Echo Colour Blue:  %BLUE%>%LOGFolder%\debug-batch.log
	Echo Colour Red:   %RED%>>%LOGFolder%\debug-batch.log
	Echo Colour Amber: %AMBER%>>%LOGFolder%\debug-batch.log
	Echo Colour Green: %GREEN%>>%LOGFolder%\debug-batch.log
	Echo.>>%LOGFolder%\debug-batch.log
	Echo Cmd folder: %CMDFolder%>>%LOGFolder%\debug-batch.log
	Echo Ant folder: %ANTFolder%>>%LOGFolder%\debug-batch.log
	Echo VCS folder: %VCSFolder%>>%LOGFolder%\debug-batch.log
	Echo Log folder: %LOGFolder%>>%LOGFolder%\debug-batch.log
	Echo.>>%LOGFolder%\debug-batch.log
	Echo NUM:  "%NUM%">>%LOGFolder%\debug-batch.log
	Echo ORG:  %ORG%>>%LOGFolder%\debug-batch.log
	Echo USR:  %USR%>>%LOGFolder%\debug-batch.log
	Echo PWD:  %PWD%>>%LOGFolder%\debug-batch.log
	Echo URL:  %URL%>>%LOGFolder%\debug-batch.log
	Echo PKG:  %PKG%>>%LOGFolder%\debug-batch.log
	Echo.>>%LOGFolder%\debug-batch.log
	Type %LOGFolder%\debug-batch.log
	Pause
	Goto Action

REM ===============================================================

:SelectPKG
	Cls
	Color %GREEN%

	Echo.
	Echo = Select the Change Set to be retrieved from %ORG%
	Echo ==========================================================
	Echo.
	Echo - 0 ......... %PKG0%
	Echo.
	Echo - 1 ......... %PKG1%
	Echo.
	Echo - 2 ......... %PKG2%
	Echo.
	Echo - 3 ......... %PKG3%
	Echo.
	Echo - 4 ......... %PKG4%
	Echo.
	Echo - 5 ......... %PKG5%
	Echo.
	Echo - 6 ......... %PKG6% 
	Echo.
	Echo - 7 ......... %PKG7%
	Echo.
	Echo - 8 ......... %PKG8%
	Echo.
	Echo - 9 ......... %PKG9%
	Echo.
	Echo.
	Echo - B ......... Back
	Echo - Q ......... Quit
	Echo.

Set Selection=
	Set /P Selection=Type your selection AND PRESS ENTER:
	If NOT '%Selection%'=='' SET Selection=%Selection:~0,1%
	If /I '%Selection%'==''  GOTO SelectPKG

	If /I '%Selection%'=='0' GOTO PKG0
	If /I '%Selection%'=='1' GOTO PKG1
	If /I '%Selection%'=='2' GOTO PKG2
	If /I '%Selection%'=='3' GOTO PKG3
	If /I '%Selection%'=='4' GOTO PKG4
	If /I '%Selection%'=='5' GOTO PKG5
	If /I '%Selection%'=='6' GOTO PKG6
	If /I '%Selection%'=='7' GOTO PKG7
	If /I '%Selection%'=='8' GOTO PKG8
	If /I '%Selection%'=='9' GOTO PKG9
	If /I '%Selection%'=='B' GOTO Action
	If /I '%Selection%'=='Q' GOTO End
	Goto End

REM ===============================================================

:PKG0
	Set PKG=%PKG0%
	Goto RetrievePKG

:PKG1
	Set PKG=%PKG1%
	Goto RetrievePKG

:PKG2
	Set PKG=%PKG2%
	Goto RetrievePKG

:PKG3
	Set PKG=%PKG3%
	Goto RetrievePKG

:PKG4
	Set PKG=%PKG4%
	Goto RetrievePKG

:PKG5
	Set PKG=%PKG5%
	Goto RetrievePKG

:PKG6
	Set PKG=%PKG6%
	Goto RetrievePKG

:PKG7
	Set PKG=%PKG7%
	Goto RetrievePKG

:PKG8
	Set PKG=%PKG8%
	Goto RetrievePKG

:PKG9
	Set PKG=%PKG9%
	Goto RetrievePKG

:RetrievePKG
	Cd %ANTFolder%
	Del %LOGFolder%\retrieve-PKG.log
	Call %ANT_HOME%\bin\ant.bat -Dsf.usr=%USR% -Dsf.pwd=%PWD% -Dsf.url=%URL% -Dsf.pkg=%PKG% -logfile %LOGFolder%\retrieve-PKG.log retrievePKG
	Type %LOGFolder%\retrieve-PKG.log
	Echo.
	Pause
	Goto Action

:End
