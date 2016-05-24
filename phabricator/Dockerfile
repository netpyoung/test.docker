FROM hachque/phabricator:latest

ADD plugin_sprint.sh /plugin_sprint.sh
RUN su git -c '/bin/bash /plugin_sprint.sh'

WORKDIR /
CMD ["/init"]