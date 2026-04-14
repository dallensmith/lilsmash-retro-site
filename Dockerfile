# Use the official Nginx image as a base
FROM nginx:alpine

# Copy the static website files to the Nginx html directory
COPY public_html /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
