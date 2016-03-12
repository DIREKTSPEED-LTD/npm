FROM node:5.6
# workaround for this: https://github.com/npm/npm/issues/9863
# Discussed in https://github.com/npm/npm/pull/10805
MAINTAINER Frank Lemanschik <frank@dspeed.eu>
WORKDIR /usr/local/lib/node_modules/npm
RUN npm install --save fs-extra
RUN sed -i s/graceful-fs/fs-extra/g /usr/local/lib/node_modules/npm/lib/utils/rename.js
RUN sed -i s/fs.rename/fs.move/g /usr/local/lib/node_modules/npm/lib/utils/rename.js
WORKDIR /app
#...... main part of the Dockerfile greetings.
