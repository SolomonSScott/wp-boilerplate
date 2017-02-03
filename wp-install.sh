#!/bin/sh
#
# Instructions:
#
# First, create the directory where you want to install WordPress.
#
# Then, `cd` into this newly created directory
#
#

if [ "$(uname -s)" != "Darwin" ]; then
  echo "Sorry, you need Mac OS X to run this." >&2
  exit 1
fi

echo "
*** Fetching latest WordPress... (hang on)"

# Get latest, stable WordPress package
curl -#Lo wordpress.zip http://wordpress.org/latest.zip

echo "
*** Unpacking WP..."

# Unzip the package and clean up files we don't need, including OSX-related cruft
unzip -q wordpress.zip
mv wordpress/* .

echo "
*** Cleaning up..."

rm -rf __MACOSX
rm -rf wordpress/
rm wordpress.zip
rm wp-config-sample.php

echo "
*** Configuring WP for local development..."

# Now, setup WP with a sane development environment
# First, get the latest package, and clean up when done
curl -#Lo master.zip https://github.com/SolomonSScott/wp-config-environments/archive/master.zip
unzip -q master.zip
rm master.zip
mv wp-config-environments-master*/* wp-config-environments-master*/.[^.]* .
rm -rf wp-config-environments-master*/

echo "
*** Setting up .gitignore template..."

# Setup .gitignore
mv gitignore-sample .gitignore

echo "
*** All done!
"