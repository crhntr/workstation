#!/usr/bin/env bash

main() {
	echo
	echo '  To frame it in our values, the question is this:'
	echo '  at any moment, and with whomever you interact be'
	echo '  they colleague, customer or competitor, are you'
	echo '  being ethical, effective and kind?'
	echo
	echo "  If so, then yes: you've earned the right to share"
	echo "  your culture. If not, well, you all know how to "
	echo "  iterate on your own selves. Make it so."
	echo

	echo "Available Disk Space: $(df -h -l | grep ' /$' | awk '{print $4}')"
}

main "$@"
