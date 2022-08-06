SERVICE=battery-threshold
BIN=bat-charge

install:
	mkdir -p /opt/battery-threshold/
	chgrp -R kintrix /opt/battery-threshold/
	install -o root -g root -p ./bat-charge /usr/bin/$(BIN)
	install -o root -g root -p ./service/battery-threshold /etc/sv/$(SERVICE)

uninstall:
	rm /usr/bin/$(BIN)
	rm /etc/sv/$(SERVICE)
	rm /opt/battery-threshold
