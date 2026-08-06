FROM nginxinc/nginx-unprivileged:alpine

WORKDIR /usr/share/nginx/html

# Copy static assets directly to nginx html directory
COPY . .

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 CMD wget -qO- http://localhost:8080/health || exit 1

CMD ["nginx", "-g", "daemon off;"]