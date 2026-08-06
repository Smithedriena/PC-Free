FROM nginxinc/nginx-unprivileged:alpine

# Copy static files to the Nginx document root
COPY --chown=nginx:nginx . /usr/share/nginx/html

# Copy custom nginx configuration
COPY --chown=nginx:nginx nginx.conf /etc/nginx/conf.d/default.conf

# Expose unprivileged port
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]