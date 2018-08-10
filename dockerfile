FROM nginx

MAINTAINER 91yun https://www.91yunco

RUN apt-get update
RUN apt-get -y install gcc g++ make git
RUN git clone https://github.com/91yun/ServerStatus
RUN cp -rf /ServerStatus/web/* /usr/share/nginx/html/


WORKDIR /ServerStatus/server

RUN make
RUN pwd && ls -a

EXPOSE 80 3561

CMD nohup sh -c '/etc/init.d/nginx start && /ServerStatus/server/sergate --config=/ServerStatus/server/config.json --port=3561 --web-dir=/usr/share/nginx/html'
