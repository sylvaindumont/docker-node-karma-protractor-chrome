[![docker stars](https://img.shields.io/docker/stars/weboaks/node-karma-protractor-chrome.svg)](https://hub.docker.com/r/weboaks/node-karma-protractor-chrome/)
[![docker pulls](https://img.shields.io/docker/pulls/weboaks/node-karma-protractor-chrome.svg)](https://hub.docker.com/r/weboaks/node-karma-protractor-chrome/)
[![docker build](https://img.shields.io/docker/build/weboaks/node-karma-protractor-chrome.svg)](https://hub.docker.com/r/weboaks/node-karma-protractor-chrome/)
[![automated build](https://img.shields.io/docker/automated/weboaks/node-karma-protractor-chrome.svg)](https://hub.docker.com/r/weboaks/node-karma-protractor-chrome/)
[![travis  build](https://travis-ci.org/sylvaindumont/docker-node-karma-protractor-chrome.svg?branch=master)](https://travis-ci.org/sylvaindumont/docker-node-karma-protractor-chrome)

alpine headless: [![](https://images.microbadger.com/badges/image/weboaks/node-karma-protractor-chrome:alpine.svg)](https://microbadger.com/images/weboaks/node-karma-protractor-chrome:alpine 'alpine headless')  
debian headless: [![](https://images.microbadger.com/badges/image/weboaks/node-karma-protractor-chrome.svg)](https://microbadger.com/images/weboaks/node-karma-protractor-chrome 'debian headless')  
xvfb: [![](https://images.microbadger.com/badges/image/weboaks/node-karma-protractor-chrome:headless.svg)](https://microbadger.com/images/weboaks/node-karma-protractor-chrome:headless 'Get your own image badge on microbadger.com')

# Karma and Protractor with Chromium in a docker container

This image allows to run javascript tests in a headless machine like a CI server.

This image support karma and protractor test under chromium.

Unfortunately, chromium doesn't support container (https://github.com/travis-ci/travis-ci/issues/938), you need to start chromium with --no-sandbox argument to avoid this.

## usage
### in a shell

```bash
docker run --rm -v $(pwd):/app -w /app -it weboaks/node-karma-protractor-chrome:alpine sh
```

### in gitlab ci
```yaml
job name:
  image: weboaks/node-karma-protractor-chrome:alpine
```


## configuration
To configure karma and protractor, use this snippets:

### karma

```javascript
browsers: ['Chromium_no_sandbox'],
customLaunchers: {
  Chromium_no_sandbox: {
    base: 'ChromiumHeadless',
    flags: ['--no-sandbox']
  }
},
```

ChromiumHeadless is available since karma-chrome-launcher@2.2.0, on previous versions use:

```javascript
base: 'Chromium',
flags: ['--no-sandbox', '--headless', '--disable-gpu', '--remote-debugging-port=9222']
```

### protractor

```javascript
capabilities: {
  'browserName': 'chrome',
  'chromeOptions': {
    'args': ['no-sandbox', 'headless', 'disable-gpu']
  }
},
```

## tags
### headless mode

Chromium recently [added headless support](https://chromium.googlesource.com/chromium/src/+/lkgr/headless/README.md).
If you want to use headless mode use the [![](https://images.microbadger.com/badges/version/weboaks/node-karma-protractor-chrome:headless.svg)](https://microbadger.com/images/weboaks/node-karma-protractor-chrome:headless 'Get your own version badge on microbadger.com') version and follow instructions in this readme.

If you don't want to use the headless mode, use
[![](https://images.microbadger.com/badges/version/weboaks/node-karma-protractor-chrome:xvfb.svg)](https://microbadger.com/images/weboaks/node-karma-protractor-chrome:xvfb 'Get your own version badge on microbadger.com')
or
[![](https://images.microbadger.com/badges/version/weboaks/node-karma-protractor-chrome.svg)](https://microbadger.com/images/weboaks/node-karma-protractor-chrome 'Get your own version badge on microbadger.com') and follow instructions in [that readme](https://github.com/sylvaindumont/docker-node-karma-protractor-chrome/tree/xvfb)

### alpine headless

To use alpine instead of debian, follow headless instructions and add this to protractor config :

```
chromeDriver: '/usr/bin/chromedriver',
```

### node versions

[![](https://images.microbadger.com/badges/version/weboaks/node-karma-protractor-chrome:headless.svg)](https://microbadger.com/images/weboaks/node-karma-protractor-chrome:headless) and [![](https://images.microbadger.com/badges/version/weboaks/node-karma-protractor-chrome:alpine.svg)](https://microbadger.com/images/weboaks/node-karma-protractor-chrome:alpine) use the latest LTS node.

Others debian `headless` node versions are avalaible via the `debian-node6` `debian-node8` `debian-node9` tags.

Others `alpine` headless node versions are avalaible via the `alpine-node6` `alpine-node8` `alpine-node9` tags.

### root versions

`debian*` and `alpine*` have no root access, if you need root access use `debian-root`, `alpine-root`, or `xvfb`

### pinned tags

`headless`, `alpine`, `debian-node*` and `alpine-node*` are automated build, rebuild each time a commit is pushed to this repo and each time an image is pushed to official `node` image. These tags are always up to date, but can break builds with a new node version or a new chromium versions.

`debian-<commit-hash>` and `alpine-<commit-hash>` tags are available to target a specific commit, they are never rebuilt and will have the same node and chromium version forever.
