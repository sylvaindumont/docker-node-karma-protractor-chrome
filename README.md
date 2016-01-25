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
        flags: ['--no-sandbox']
      }
    },

### protractor:

    capabilities: {
      'browserName': 'chrome',
      'chromeOptions': {
        'args': ['no-sandbox']
      }
    },

## Gitlab CI

To run karma and protractor on gitlab ci, just use this image, and configure karma and protractor as above. 
http://doc.gitlab.com/ce/ci/yaml/README.html#image-and-services

## On Docker Hub
https://hub.docker.com/r/weboaks/node5-karma-protractor-chrome/

    docker pull weboaks/node5-karma-protractor-chrome
