#!/bin/sh

# Đợi PostgreSQL sẵn sàng
until nc -z postgres 5432; do
  echo "⏳ Waiting for PostgreSQL..."
  sleep 2
done

# Tạo APP_KEY nếu chưa có
if ! php artisan key:check >/dev/null 2>&1; then
  echo "🔑 Generating APP_KEY..."
  php artisan key:generate
fi

# Migrate nếu cần
echo "🗄️ Running migrations..."
php artisan migrate --force

# Khởi động php-fpm
exec php-fpm
