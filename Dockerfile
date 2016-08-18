FROM nginx:latest
RUN apt-get update -qq && apt-get -y install wget unzip


ENTRYPOINT ["/bin/start.sh"]
EXPOSE 80
VOLUME /templates
ENV CONSUL_URL consul:8500

ADD start.sh /bin/start.sh
RUN rm -v /etc/nginx/conf.d/*.conf

ENV CT_URL https://releases.hashicorp.com/consul-template/0.15.0/consul-template_0.15.0_linux_amd64.zip

#Install Consul Template
#RUN curl -L $CT_URL | \
RUN wget $CT_URL && \
unzip consul-template_0.15.0_linux_amd64.zip -d /usr/local/bin 

#ADD https://github.com/hashicorp/consul-template/releases/download/v0.7.0/consul-template_0.7.0_linux_amd64.tar.gz /usr/bin/
#RUN tar -C /usr/local/bin --strip-components 1 -zxf /usr/bin/consul-template_0.7.0_linux_amd64.tar.gz
