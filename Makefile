all:
	echo Specify a target.

install:
	mkdir -p /etc/systemd/system/
	cp -v autocleaner.service /etc/systemd/system/
	cp -v autocleaner.timer /etc/systemd/system/
	mkdir -p /etc/autocleaner
	cp -v config.rb.example /etc/autocleaner/config.rb
	systemctl daemon-reload

activate:
	systemctl enable --now autocleaner.timer

