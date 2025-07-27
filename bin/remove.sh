#!/bin/sh

# A shell script to delete a site.
# Based on https://jeremy.hu/dev-environment-laravel-valet-wp-cli/.

site_name=$1

if [ -z "$site_name" ]; then
	error "Please provide your site's name. No Spaces, just lowercase."
	exit 1;
fi

echo "Removing '$site_name' site..."

# Change this to a directory where your sites live.
cd ~/Projects
valet unlink $site_name
rm -rf $site_name

# Delete the matching database table.
echo "DROP DATABASE IF EXISTS $site_name" | mysql -h127.0.0.1 -uroot

exit 0;
