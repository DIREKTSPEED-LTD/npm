FROM node:5.6
# workaround for this: https://github.com/npm/npm/issues/9863
# Discussed in https://github.com/npm/npm/pull/10805
MAINTAINER Frank Lemanschik <frank@dspeed.eu>
RUN cd $(npm root -g)/npm \
 && npm install fs-extra \
 && sed -i -e s/graceful-fs/fs-extra/ -e s/fs\.move/fs.rename/ ./lib/utils/rename.js
WORKDIR /app
#...... main part of the Dockerfile greetings.
