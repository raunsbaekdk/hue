# Apache configuration
# Modifications to conf/apache2/heroku.conf from the Heroku PHP buildpack
#echo "ServerSignature Off" >> /app/vendor/heroku/heroku-buildpack-php/conf/apache2/heroku.conf
#echo "ServerTokens Prod" >> /app/vendor/heroku/heroku-buildpack-php/conf/apache2/heroku.conf



# PHP configuration
# Modifications to conf/php/php.ini from the Heroku PHP buildpack
sed -i 's/short_open_tag = .*/short_open_tag = Off/g' /app/vendor/heroku/heroku-buildpack-php/conf/php/php.ini
sed -i 's/zlib\.output_compression = .*/zlib\.output_compression = On/g' /app/vendor/heroku/heroku-buildpack-php/conf/php/php.ini
sed -i 's/expose_php = .*/expose_php = Off/g' /app/vendor/heroku/heroku-buildpack-php/conf/php/php.ini
sed -i 's/max_execution_time = .*/max_execution_time = 30/g' /app/vendor/heroku/heroku-buildpack-php/conf/php/php.ini
sed -i 's/max_input_time = .*/max_input_time = 30/g' /app/vendor/heroku/heroku-buildpack-php/conf/php/php.ini
sed -i 's/memory_limit = .*/memory_limit = 128M/g' /app/vendor/heroku/heroku-buildpack-php/conf/php/php.ini
sed -i 's/error_reporting = .*/error_reporting = E_ALL \& \~E_NOTICE/g' /app/vendor/heroku/heroku-buildpack-php/conf/php/php.ini
sed -i 's/post_max_size = .*/post_max_size = 2M/g' /app/vendor/heroku/heroku-buildpack-php/conf/php/php.ini
sed -i 's/;default_charset = .*/default_charset = "UTF-8"/g' /app/vendor/heroku/heroku-buildpack-php/conf/php/php.ini
sed -i 's/file_uploads = .*/file_uploads = Off/g' /app/vendor/heroku/heroku-buildpack-php/conf/php/php.ini
sed -i 's/upload_max_filesize = .*/upload_max_filesize = 2M/g' /app/vendor/heroku/heroku-buildpack-php/conf/php/php.ini
sed -i 's/max_file_uploads = .*/max_file_uploads = 2/g' /app/vendor/heroku/heroku-buildpack-php/conf/php/php.ini
sed -i 's/;user_agent=.*/user_agent = "Heroku-hue"/g' /app/vendor/heroku/heroku-buildpack-php/conf/php/php.ini
sed -i 's/default_socket_timeout = .*/default_socket_timeout = 20/g' /app/vendor/heroku/heroku-buildpack-php/conf/php/php.ini
sed -i 's/date.timezone = .*/date.timezone = "Europe\/Copenhagen"/g' /app/vendor/heroku/heroku-buildpack-php/conf/php/php.ini
sed -i 's/mail\.add_x_header = .*/mail\.add_x_header = Off/g' /app/vendor/heroku/heroku-buildpack-php/conf/php/php.ini



# Launch Nginx with PHP
vendor/bin/heroku-php-nginx -C nginx_app.conf web/

# Launch Apache with PHP
#vendor/bin/heroku-php-apache2 web/