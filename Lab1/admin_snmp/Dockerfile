FROM ubuntu:18.04

RUN apt-get update && apt-get install snmpd -y
COPY snmpd.conf /etc/snmpd/
EXPOSE 161

RUN /etc/init.d/snmpd start
CMD bash -c 'while true; do sleep 1000; done'