# Raneto Wiki

## Prerequisites

- VirtualBox
- Vagrant

## Starting server

```
host> vagrant up
host> vagrant ssh

client$ cd Raneto-0.7.1
client$ npm start
```

Open host browser and visit URL [http://127.0.0.1:8080](http://127.0.0.1:8080).

## Proxy settings

In case you require custom proxy settings ensure to copy the following file to this folder (containing this `README.md` file):

```
.npmrc
.bowerrc
.wgetrc
```

In case you don't have these files yet: Here's a good instruction on how to setup these files [http://digitaldrummerj.me/proxy-configurations/](http://digitaldrummerj.me/proxy-configurations/).
