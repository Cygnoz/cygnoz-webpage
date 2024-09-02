# Use the official PHP image with Apache
FROM php:8.1-apache

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libzip-dev \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mbstring zip

# Enable Apache mod_rewrite for URL rewriting
RUN a2enmod rewrite

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy application source code to the container
COPY . /var/www/html/

# If you have Composer dependencies, install Composer and PHP dependencies
# Uncomment the following lines if you have composer.json and composer.lock
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# RUN composer install --no-dev --optimize-autoloader

# Adjust file permissions for Apache
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose port 80 for web traffic
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
