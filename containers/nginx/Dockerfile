FROM nginx:latest
#ADD ./nginx/conf/nginx.conf /etc/nginx/nginx.conf
RUN rm -f /etc/nginx/conf.d/*
ADD ./containers/nginx/nginx.conf /etc/nginx/conf.d/default.conf
CMD ["/usr/sbin/nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]
