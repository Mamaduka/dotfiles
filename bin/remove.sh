#!/bin/sh

# A shell script to delete a site.
# Based on https://jeremy.hu/dev-environment-laravel-valet-wp-cli/.

set -e

site_name=$1

if [ -z "$site_name" ]; then
	echo "Please provide your site's name. No Spaces, just lowercase."
	exit 1;
fi

echo "Removing '$site_name' site..."

cd ~/Projects/$site_name

# Drop DB via wp-cli (uses wp-config.php credentials).
wp db drop --yes

cd ..
valet unlink $site_name
rm -rf $site_name

exit 0;
