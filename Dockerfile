FROM kong:latest

# Copy Kong declarative configuration
COPY config.yaml /usr/local/kong/declarative/config.yaml

# Copy SSL certificates if they exist
COPY ssl/ /tmp/ssl/

# Set environment variables for DB-less mode
ENV KONG_DATABASE=off
ENV KONG_DECLARATIVE_CONFIG=/usr/local/kong/declarative/config.yaml
ENV KONG_PROXY_ACCESS_LOG=/dev/stdout
ENV KONG_ADMIN_ACCESS_LOG=/dev/stdout
ENV KONG_PROXY_ERROR_LOG=/dev/stderr
ENV KONG_ADMIN_LISTEN=0.0.0.0:8001

# SSL configuration (adjust paths if needed)
ENV KONG_SSL_CERT=/tmp/ssl/cert.pem
ENV KONG_SSL_CERT_KEY=/tmp/ssl/key.pem

# Expose ports
EXPOSE 8000 8443 8001 8444

# Start Kong
CMD ["kong", "start"]