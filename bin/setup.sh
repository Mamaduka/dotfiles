#!/bin/sh

# A shell script for creating WP sites with Valet.
# Based on https://jeremy.hu/dev-environment-laravel-valet-wp-cli/.

set -e

cd ~/Sites

site_name=$1

BLUE_BOLD='\033[1;34m';
GREEN_BOLD='\033[1;32m';
RED_BOLD='\033[1;31m';
YELLOW_BOLD='\033[1;33m';
COLOR_RESET='\033[0m';

# Enable nicer messaging.
error () {
	echo "${RED_BOLD}$1${COLOR_RESET}"
}
status () {
	echo "${BLUE_BOLD}$1${COLOR_RESET}"
}
success () {
	echo "${GREEN_BOLD}$1${COLOR_RESET}"
}
warning () {
	echo "${YELLOW_BOLD}$1${COLOR_RESET}"
}

if [ -z "$site_name" ]; then
	error "Please provide your site's name. No Spaces, just lowercase."
	exit 1;
fi

mkdir $site_name
cd $site_name

status "➤ Link the current working directory to Valet."
valet link

status "➤ Creating database..."
echo "CREATE DATABASE $site_name" | mysql -h127.0.0.1 -uroot

status "➤ Installing WordPress..."
wp core download
wp config create --dbname=$site_name --dbuser=root --dbpass='' --dbhost=127.0.0.1 --extra-php <<PHP
define( 'WP_POST_REVISIONS', false );

if ( WP_DEBUG ) {
	@error_reporting( E_ALL );
	@ini_set( 'log_errors', true );
	@ini_set( 'log_errors_max_len', '0' );

	define( 'WP_DEBUG_LOG', true );
	define( 'WP_DEBUG_DISPLAY', false );
	define( 'SAVEQUERIES', false );

	// Scripts.
	define( 'CONCATENATE_SCRIPTS', false );
	define( 'SCRIPT_DEBUG', true );
}
PHP

# Change admin user/pass as needed.
wp core install --url=$site_name.test --title=$site_name --admin_user=mamaduka --admin_password=password --admin_email=george@mamaduka.com --skip-email

# Delete inactive plugins. Akismet and Hello Dolly.
wp plugin delete $(wp plugin list --field=name)

status "➤ Secure with TLS (y/n)?"
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
	valet secure $site_name
fi

success "✓ Excellent. Your new site is ready! URL: http://$site_name.test/wp-admin/"

exit 0;
