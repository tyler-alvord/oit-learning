#!/usr/bin/env bash

function exit-tosbash () {
	trap 2
	exit
}

trap '' 2

echo "ALL ACTIVITY IN THIS IMAGE IS SUBJECT TO THE RULES OF ENGAGEMENT LAID OUT BY THE OIT STAFF. THE RULES OF ENGAGEMENT WILL LOAD IN A BROWSER WINDOW NOW. PLEASE READ THROUGH THEN TYPE ACCEPT (non-case-sensitive) TO ACKNOWLEDGE THE TERMS AND START THE SESSION."

DESTINATION="https://www.google.com"

firefox "$DESTINATION"

CONTINUE="TRUE"
while [ "$CONTINUE" == "TRUE" ]
	do
		read -p " $(tput setaf 7) Enter a command: " RESULT

		case "$RESULT" in 
			[aA] | [aA][cC][cC][eE][pP][tT])
				echo "STARTING LOW ORBIT ION CANON"
				wine start '\usr\local\bin\LOIC.exe'
				exit-tosbash
				;;
			[sS] | [sS][hH][oO][wW])
				firefox "$DESTINATION"
				;;
			[hH] | [hH][eE][lL][pP])
				echo "$(tput setaf 1) The following are valid commands:"
				echo "$(tput setaf 3) ACCEPT | a : $(tput setaf 7) Accept the terms and start the session"
				echo "$(tput setaf 3) SHOW | s : $(tput setaf 7) Show the rules of engagement again. Good if you accidentally closed the browser window and need to read through again."
				echo "$(tput setaf 3) HELP | h : $(tput setaf 7) You probably already know this, since you're here"
				;;
			*)
				echo "$(tput setaf 1) Invalid input, enter a valid command."
				;;
		esac
	done
