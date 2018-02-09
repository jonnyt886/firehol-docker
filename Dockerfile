FROM debian:latest

RUN apt-get update \
	&& apt-get install -y automake git autoconf kmod \
		procps iprange traceroute iputils-ping curl \
		ipset iptables make \
	&& git clone --depth 1 https://github.com/firehol/firehol.git firehol \
	&& cd /tmp/firehol \
	&& ./autogen.sh \
	&& ./configure --disable-doc --disable-man --prefix=/usr \
		--sysconfdir=/etc --localstatedir=/var \
	&& make \
	&& make install \
	&& cd / \
	&& apt-get remove -y make automake git autoconf \
	&& rm -r /tmp/firehol

ENTRYPOINT ["/usr/sbin/firehol"]
