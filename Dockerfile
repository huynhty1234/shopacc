    # Sử dụng PHP 8.2 với FPM
FROM php:8.2-fpm

# Cài đặt các package cần thiết
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    curl \
    git \
    libzip-dev \
    && docker-php-ext-install pdo_mysql mbstring zip exif pcntl

# Cài Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Tạo thư mục làm việc
WORKDIR /var/www

# Copy toàn bộ project vào container
COPY . .

# Cài đặt Laravel dependencies
RUN composer install --no-dev --optimize-autoloader

# Phân quyền cho thư mục storage & bootstrap
RUN chown -R www-data:www-data \
    /var/www/storage \
    /var/www/bootstrap/cache

# Lệnh chạy Laravel
CMD php artisan serve --host=0.0.0.0 --port=8000

# Mở cổng 8000
EXPOSE 8000
