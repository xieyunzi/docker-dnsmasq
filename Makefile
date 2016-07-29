all:
	docker run \
		--name dnsmasq \
		-d \
		-p 53:53/udp \
		-p 12333:8080 \
		-v $(HOME)/.config/dnsmasq/dnsmasq.conf:/etc/dnsmasq.conf \
		dnsmasq-gui:latest

.PHONY: all
