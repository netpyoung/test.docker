FROM hachque/phabricator:latest

ADD plugin_sprint.sh /plugin_sprint.sh
RUN su git -c '/bin/bash /plugin_sprint.sh'

ADD waiting_mysql.sh /waiting_mysql.sh
RUN zypper --non-interactive install curl

WORKDIR /
CMD ["/waiting_mysql.sh"]
CMD ["/init"]