SERVICE=battery-threshold
BIN=bat-charge
GROUP=kin

install:
	mkdir -p /opt/battery-threshold/
	touch /opt/battery-threshold/charge-control-end-threshold
	chown -R root /opt/battery-threshold/
	chgrp -R $(GROUP) /opt/battery-threshold/
	chmod -R g+w /opt/battery-threshold
	install -o root -g root -p ./bat-charge /usr/bin/$(BIN)
	cp -r --preserve=timestamps ./service/battery-threshold /etc/sv/$(SERVICE)
	chown root /etc/sv/$(SERVICE)
	chgrp root /etc/sv/$(SERVICE)

uninstall:
	rm /usr/bin/$(BIN)
	rm -r /etc/sv/$(SERVICE)
	rm -r /opt/battery-threshold
