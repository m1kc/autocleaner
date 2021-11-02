all:
	echo Specify a target.

install:
	mkdir -p /etc/systemd/system/
	cp -v autocleaner.{service,timer} /etc/systemd/system/
	systemctl daemon-reload

activate:
	systemctl enable --now autocleaner.timer

