# Use an official Alpine Linux as a parent image
FROM alpine:latest

# Install or Update Apache
RUN apk --update add apache2 

# Copy httpd.conf the current directory contents into the container at /etc/apache2
COPY httpd.conf /etc/apache2

# Copy info.conf the current directory contents into the container at /etc/apache2/conf.d
COPY info.conf /etc/apache2/conf.d

# Make port 80 available to the world outside this container
EXPOSE 80

# Change "It Works!" on /var/www/localhost/htdocs/index.html
RUN sed -i  's/It works!/It works on Docker Server Status!/g' /var/www/localhost/htdocs/index.html 

# Run httpd service when the container launches
CMD ["httpd", "-D", "FOREGROUND"]