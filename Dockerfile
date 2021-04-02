FROM httpd:latest

COPY httpd.conf /usr/local/apache2/conf/httpd.conf

# This is the Additional Directory where we are going to keep our Virtualhost configuraiton files
# You can use the image to create N number of different virtual hosts
RUN mkdir -p /usr/local/apache2/conf/sites/

RUN mkdir -p /usr/local/apache2/html/

COPY default.conf /usr/local/apache2/conf/sites/default.conf
COPY index.html /usr/local/apache2/html/index.html
COPY script.js /usr/local/apache2/html/script.js

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]