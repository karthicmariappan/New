# Use nginx as base image
FROM nginx:alpine

# Copy built files from dist/ into nginx html directory
COPY dist/ /usr/share/nginx/html

# Expose port 3000 (we want app on 3000 instead of default 80)
EXPOSE 3000

# Replace nginx default config to listen on 3000
RUN sed -i 's/listen       80;/listen       3000;/' /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]