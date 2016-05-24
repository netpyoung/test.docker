#!/bin/bash
#
# Author: Sameer Naik <sameer@damagehead.com>
# Gist: https://gist.github.com/sameersbn/dd24dfdd13bc472d11a5
# Short Url (raw): http://goo.gl/iJcvCP
#
# Installs a bunch of plugins for the docker-redmine image
#
# Usage:
#   $ mkdir -p /opt/redmine/data/plugins
#   $ cd /opt/redmine/data/plugins
#   $ wget http://goo.gl/iJcvCP -O - | sh
#

set -e

#
## Install tarballs
#

# redmine tweaks plugin
# HOMEPAGE: https://github.com/alexandermeindl/redmine_tweaks
rm -rf redmine_tweaks
mkdir -p redmine_tweaks
wget -nv https://github.com/alexandermeindl/redmine_tweaks/archive/master.tar.gz -O - | tar -zvxf - --strip=1 -C redmine_tweaks

# line numbers plugin
# HOMEPAGE: https://github.com/cdwertmann/line_numbers
rm -rf line_numbers
mkdir -p line_numbers
wget -nv https://github.com/cdwertmann/line_numbers/archive/master.tar.gz -O - | tar -zvxf - --strip=1 -C line_numbers

# did you mean? plugin
# HOMEPAGE: https://github.com/abahgat/redmine_didyoumean
REDMINE_DID_YOU_MEAN_VERSION=1.2.0
rm -rf redmine_didyoumean
mkdir -p redmine_didyoumean
wget -nv https://github.com/abahgat/redmine_didyoumean/archive/${REDMINE_DID_YOU_MEAN_VERSION}.tar.gz -O - | tar -zvxf - --strip=1 -C redmine_didyoumean

# redmine embed video plugin
# HOMEPAGE: https://github.com/cforce/redmine_embedded_video
rm -rf redmine_embedded_video
mkdir -p redmine_embedded_video
wget -nv https://github.com/cforce/redmine_embedded_video/archive/master.tar.gz -O - | tar -zvxf - --strip=1 -C redmine_embedded_video

# redmine gist plugin
# HOMEPAGE: https://github.com/dergachev/redmine_gist
rm -rf redmine_gist
mkdir -p redmine_gist
wget -nv https://github.com/dergachev/redmine_gist/archive/master.tar.gz -O - | tar -zvxf - --strip=1 -C redmine_gist

# redmine tags plugin
# HOMEPAGE: https://github.com/ixti/redmine_tags
REDMINE_TAGS_VERSION=2.1.0
rm -rf redmine_tags
mkdir -p redmine_tags
wget -nv https://github.com/ixti/redmine_tags/archive/${REDMINE_TAGS_VERSION}.tar.gz -O - | tar -zvxf - --strip=1 -C redmine_tags

# issuefy plugin
# HOMEPAGE: https://github.com/tchx84/issuefy
rm -rf issuefy
mkdir -p issuefy
wget -nv https://github.com/tchx84/issuefy/archive/master.tar.gz -O - | tar -zvxf - --strip=1 -C issuefy

# open flash charts plugin (required by redmine_charts2)
# HOMEPAGE: https://github.com/pullmonkey/open_flash_chart
rm -rf open_flash_chart
mkdir -p open_flash_chart
wget -nv https://github.com/pullmonkey/open_flash_chart/archive/master.tar.gz -O - | tar -zvxf - --strip=1 -C open_flash_chart

cat >> init <<EOF
# copy open_flash_chart public assets
if [ ! -d /home/redmine/redmine/public/plugin_assets/open_flash_chart ]; then
  mkdir -p /home/redmine/redmine/public/plugin_assets/open_flash_chart
  cp -r /home/redmine/data/plugins/open_flash_chart/assets/* /home/redmine/redmine/public/plugin_assets/open_flash_chart
fi

EOF

# redmine charts2 plugin
# HOMEPAGE: https://github.com/pharmazone/redmine_charts2
rm -rf redmine_charts2
mkdir -p redmine_charts2
wget -nv https://github.com/pharmazone/redmine_charts2/archive/redmine21.tar.gz -O - | tar -zvxf - --strip=1 -C redmine_charts2

# redmine announcements plugin
# HOMEPAGE: https://github.com/buoyant/redmine_announcements
REDMINE_ANNOUNCEMENTS_VERSION=v1.3
rm -rf redmine_announcements
mkdir -p redmine_announcements
wget -nv https://github.com/buoyant/redmine_announcements/archive/${REDMINE_ANNOUNCEMENTS_VERSION}.tar.gz -O - | tar -zvxf - --strip=1 -C redmine_announcements

# redmine recurring tasks
# HOMEPAGE: https://github.com/nutso/redmine-plugin-recurring-tasks
REDMINE_RECURRING_TASKS_VERSION=v1.4.0
rm -rf recurring_tasks
mkdir -p recurring_tasks
wget -nv https://github.com/nutso/redmine-plugin-recurring-tasks/archive/${REDMINE_RECURRING_TASKS_VERSION}.tar.gz -O - | tar -zvxf - --strip=1 -C recurring_tasks

cat >> init <<EOF
# list existing cron jobs for redmine user
crontab -u redmine -l 2>/dev/null >/tmp/cron.redmine

# add new job for recurring tasks if it does not exist
if ! grep -q redmine:recur_tasks /tmp/cron.redmine; then
  echo '@hourly cd /home/redmine/redmine && bundle exec rake redmine:recur_tasks RAILS_ENV=production >> log/cron_rake.log 2>&1' >>/tmp/cron.redmine
  crontab -u redmine /tmp/cron.redmine 2>/dev/null
fi

# remove the temporary file
rm -rf /tmp/cron.redmine
EOF

# redmine dashboard tasks
# HOMEPAGE: https://github.com/jgraichen/redmine_dashboard
REDMINE_DASHBOARD_VERSION=v2.6.1
rm -rf redmine_dashboard
mkdir -p redmine_dashboard
wget -nv https://github.com/jgraichen/redmine_dashboard/archive/${REDMINE_DASHBOARD_VERSION}.tar.gz -O - | tar -zvxf - --strip=1 -C redmine_dashboard
sed "s/gem 'test-unit'/# gem 'test-unit'/" -i redmine_dashboard/Gemfile

# redmine code review plugin
# HOMEPAGE: https://bitbucket.org/haru_iida/redmine_code_review
REDMINE_CODE_REVIEW_VERSION=0.7.0
rm -rf redmine_code_review
mkdir -p redmine_code_review
wget -nv https://bitbucket.org/haru_iida/redmine_code_review/get/${REDMINE_CODE_REVIEW_VERSION}.tar.gz -O - | tar -zvxf - --strip=1 -C redmine_code_review

# checklists plugin
# HOMEPAGE: https://github.com/RCRM/redmine_checklists
REDMINE_CHECKLISTS_VERSION=v3.1.1
rm -rf redmine_checklists
mkdir -p redmine_checklists
wget -nv https://github.com/RCRM/redmine_checklists/archive/${REDMINE_CHECKLISTS_VERSION}.tar.gz -O - | tar -zvxf - --strip=1 -C redmine_checklists

# redmine people plugin
# HOMEPAGE: http://redminecrm.com/projects/people/pages/1
REDMINE_PEOPLE_VERSION=0.1.8
rm -rf redmine_people
mkdir -p redmine_people
wget -nv https://github.com/RCRM/redmine_people/archive/${REDMINE_PEOPLE_VERSION}.tar.gz -O - | tar -zvxf - --strip=1 -C redmine_people

# redmine agile plugin
# HOMEPAGE: http://redminecrm.com/projects/agile/pages/1
REDMINE_AGILE_VERSION=v1.3.8
rm -rf redmine_agile
mkdir -p redmine_agile
wget -nv https://github.com/RCRM/redmine_agile/archive/${REDMINE_AGILE_VERSION}.tar.gz -O - | tar -zvxf - --strip=1 -C redmine_agile

# redmine contacts plugin
# HOMEPAGE: http://redminecrm.com/projects/crm/pages/1
REDMINE_CONTACTS_VERSION=v3.4.5
rm -rf redmine_contacts
mkdir -p redmine_contacts
wget -nv https://github.com/RCRM/redmine_contacts/archive/${REDMINE_CONTACTS_VERSION}.tar.gz -O - | tar -zvxf - --strip=1 -C redmine_contacts
sed 's/gem "spreadsheet/# gem "spreadsheet/' -i redmine_contacts/Gemfile
