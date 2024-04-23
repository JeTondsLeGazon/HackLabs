FROM nginx

COPY nginx.conf /etc/nginx
COPY mediplus-lite /data/www
RUN chown -R nginx:nginx /data/www
