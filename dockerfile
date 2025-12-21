# PHP-FPM Alpine image
FROM php:8.3-fpm-alpine

# Set working directory
WORKDIR /var/www/html

# Install system dependencies and PHP extensions
RUN apk add --no-cache \
    curl \
    git \
    unzip \
    bash \
    libzip-dev \
    oniguruma-dev \
    openssl \
    icu-dev \
    && docker-php-ext-install intl \
    && docker-php-ext-install pdo_mysql zip 
    
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer

# Copy Laravel files (optional if you want to include them in the image)
# COPY src/ ./

EXPOSE 9000
CMD ["php-fpm"]
