npm(1) -- a JavaScript package manager
==============================


~~~
FROM node:5.1

RUN rm -rf /usr/local/lib/node_modules/npm \
 && git clone https://github.com/DIREKTSPEED-LTD/npm /usr/local/lib/node_modules/npm \
 && rm -f  /usr/local/lib/node_modules/npm/.git \
 && rm -f  /usr/local/bin/npm \
 && ln -s -f /usr/local/bin/npm /usr/bin/npm \
 && cd /usr/local/lib/node_modules/npm \
 && npm install

## your normal dockerfile 
~~~
