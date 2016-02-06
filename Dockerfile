FROM node:5.4.1
# workaround for this: https://github.com/npm/npm/issues/9863
# Discussed in https://github.com/npm/npm/pull/10805
MAINTAINER Frank Lemanschik <frank@dspeed.eu>
RUN rm -rf /usr/local/lib/node_modules/npm \
 && git clone https://github.com/DIREKTSPEED-LTD/npm /usr/local/lib/node_modules/npm \
 && rm -rf  /usr/local/lib/node_modules/npm/.git \
 && ln -s -f /usr/local/bin/npm /usr/bin/npm \
 && cd /usr/local/lib/node_modules/npm \
 && npm install
