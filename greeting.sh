#!/usr/bin/env bash

main() {
	echo
	echo "	To the dumb question,"
	echo "	  'Why me?'"
	echo "	the cosmos barely bothers"
	echo "	to return the reply,"
	echo "	  'Why not?'"
	echo

	echo "Available Disk Space: $(df -h -l | grep ' /$' | awk '{print $4}')"
}

main "$@"
