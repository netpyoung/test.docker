FROM redmine:3.2

ENV PASSENGER_VERSION 5.0.28
RUN buildDeps=' \
		make \
	' \
	&& set -x \
	&& apt-get update && apt-get install -y --no-install-recommends $buildDeps && rm -rf /var/lib/apt/lists/* \
	&& gem install passenger --version "$PASSENGER_VERSION" \
	&& apt-get purge -y --auto-remove $buildDeps
RUN set -x \
	&& passenger-config install-agent \
	&& passenger-config install-standalone-runtime

# ref https://github.com/docker-library/redmine/blob/master/3.2/passenger/Dockerfile

ENV REDMINE_INSTALL_DIR /usr/src/redmine

# RUN git clone https://github.com/rkallensee/redmine-google-analytics-plugin.git plugis/
CMD ["passenger", "start"]

