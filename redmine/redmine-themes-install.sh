#!/bin/bash
#
# Author: Sameer Naik <sameer@damagehead.com>
# Gist: https://gist.github.com/sameersbn/aaa1b7bb064703c1e23c
# Short Url (raw): http://goo.gl/deKDpp
#
# Installs a bunch of themes for the docker-redmine image
#
# Usage:
#   $ mkdir -p /opt/redmine/data/themes
#   $ cd /opt/redmine/data/themes
#   $ wget http://goo.gl/deKDpp -O - | sh
#

set -e

# HOMEPAGE: http://redminecrm.com/pages/a1-theme
A1_VERSION=1_1_2
rm -rf a1
wget http://redminecrm.com/license_manager/7644/a1-${A1_VERSION}.zip -P /tmp/
unzip /tmp/a1-${A1_VERSION}.zip
rm -rf /tmp/a1-${A1_VERSION}.zip

# HOMEPAGE: http://www.redminecrm.com/pages/coffee-theme
COFFEE_VERSION=0_0_4
rm -rf coffee
wget http://www.redminecrm.com/license_manager/4508/coffee-${COFFEE_VERSION}.zip -P /tmp/
unzip /tmp/coffee-${COFFEE_VERSION}.zip
rm -rf /tmp/coffee-${COFFEE_VERSION}.zip

# HOMEPAGE: http://www.redminecrm.com/pages/redminecrm-theme
REDMINECRM_VERSION=0_0_2
rm -rf redminecrm
wget http://www.redminecrm.com/license_manager/3834/redminecrm-${REDMINECRM_VERSION}.zip -P /tmp/
unzip /tmp/redminecrm-${REDMINECRM_VERSION}.zip
rm -rf /tmp/redminecrm-${REDMINECRM_VERSION}.zip

# HOMEPAGE: http://redminecrm.com/pages/highrise-theme
HIGHRISE_VERSION=1_1_2
rm -rf highrise
wget http://redminecrm.com/license_manager/7646/highrise-${HIGHRISE_VERSION}.zip -P /tmp/
unzip /tmp/highrise-${HIGHRISE_VERSION}.zip
rm -rf /tmp/highrise-${HIGHRISE_VERSION}.zip

# HOMEPAGE: http://www.redminecrm.com/pages/circle-theme
CIRCLE_THEME_VERSION=1_0_1
rm -rf circle
wget http://www.redminecrm.com/license_manager/11619/circle_theme-${CIRCLE_THEME_VERSION}.zip -P /tmp/
unzip /tmp/circle_theme-${CIRCLE_THEME_VERSION}.zip
rm -rf /tmp/circle_theme-${CIRCLE_THEME_VERSION}.zip

# HOMEPAGE: https://github.com/makotokw/redmine-theme-gitmike
GITMIKE_VERSION=r6
rm -rf gitmike
mkdir -p gitmike
wget -nv https://github.com/makotokw/redmine-theme-gitmike/archive/${GITMIKE_VERSION}.tar.gz -O - | tar -zvxf - --strip=1 -C gitmike
