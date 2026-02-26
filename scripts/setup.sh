#!/usr/bin/env bash
# Run once after `lando start` to install WordPress

set -e

echo "Downloading WordPress core..."
lando wp core download --path=wordpress

echo "Creating wp-config.php..."
lando wp config create \
  --dbname=wordpress \
  --dbuser=wordpress \
  --dbpass=wordpress \
  --dbhost=database \
  --path=wordpress

echo "Installing WordPress..."
lando wp core install \
  --url=http://wp-template.lndo.site \
  --title="WP Template" \
  --admin_user=admin \
  --admin_password=admin \
  --admin_email=admin@example.com \
  --path=wordpress

echo "Copying custom theme..."
cp -r src/themes/wp-starter wordpress/wp-content/themes/

echo "Activating theme..."
lando wp theme activate wp-starter --path=wordpress

echo "Adding demo content..."
lando wp post create \
  --post_title="Hello World" \
  --post_content="Welcome to WP Template. This is a sample post." \
  --post_status=publish \
  --path=wordpress

lando wp post create \
  --post_type=page \
  --post_title="About" \
  --post_content="This is the about page." \
  --post_status=publish \
  --path=wordpress

echo "Done. Visit http://wp-template.lndo.site"
