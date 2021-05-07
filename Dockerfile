FROM ubuntu:latest

RUN apt update && \ 
    apt install -y nginx-full && \
    apt install -y libnginx-mod-rtmp

COPY nginx.conf /etc/nginx/nginx.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log


EXPOSE 1935
STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
