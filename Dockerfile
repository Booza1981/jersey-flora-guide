FROM nginx:alpine

# Copy the HTML file and assets
COPY Revised/Jersey_Flora_Visual_Guide_Revised.html /usr/share/nginx/html/index.html
COPY Trees /usr/share/nginx/html/Trees
COPY Wildflowers /usr/share/nginx/html/Wildflowers

# Configure nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"] 