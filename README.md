[![](https://images.microbadger.com/badges/image/weboaks/node-karma-protractor-chrome.svg)](https://microbadger.com/images/weboaks/node-karma-protractor-chrome "Get your own image badge on microbadger.com")
# Karma and Protractor in a docker container

This image allows to run javascript tests in a headless machine like a CI server.

This image support karma and protractor test under chrome.

Unfortunately, chrome doesn't support container (https://github.com/travis-ci/travis-ci/issues/938), you need to start chrome with --no-sandbox argument to avoid this.

To configure karma and protractor, use this snippets:
### karma:

    browsers: ['Chrome_no_sandbox'],
    customLaunchers: {
      Chrome_no_sandbox: {
        base: 'Chrome',
        flags: ['--no-sandbox', '--headless', '--disable-gpu', '--remote-debugging-port=9222']
      }
    },

### protractor:

    capabilities: {
      'browserName': 'chrome',
      'chromeOptions': {
        'args': ['no-sandbox', 'headless', 'disable-gpu']
      }
    },

## Headless mode

Chromium recently [added headless support](https://chromium.googlesource.com/chromium/src/+/lkgr/headless/README.md).
If you want to use headless mode use the [![](https://images.microbadger.com/badges/version/weboaks/node-karma-protractor-chrome:headless.svg)](https://microbadger.com/images/weboaks/node-karma-protractor-chrome:headless "Get your own version badge on microbadger.com")  version and follow instructions in this readme.

If you don't want to use the headless  mode, use 
[![](https://images.microbadger.com/badges/version/weboaks/node-karma-protractor-chrome:xvfb.svg)](https://microbadger.com/images/weboaks/node-karma-protractor-chrome:xvfb "Get your own version badge on microbadger.com")
or
[![](https://images.microbadger.com/badges/version/weboaks/node-karma-protractor-chrome.svg)](https://microbadger.com/images/weboaks/node-karma-protractor-chrome "Get your own version badge on microbadger.com") and follow instructions in [that readme](https://github.com/sylvaindumont/docker-node-karma-protractor-chrome/tree/xvfb)

## Gitlab CI

To run karma and protractor on gitlab ci, just use this image, and configure karma and protractor as above.
http://doc.gitlab.com/ce/ci/yaml/README.html#image-and-services

## On Docker Hub
https://hub.docker.com/r/weboaks/node-karma-protractor-chrome/

    docker pull weboaks/node-karma-protractor-chrome
