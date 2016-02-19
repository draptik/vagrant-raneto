# Raneto Wiki

This project lets you run [Raneto](http://raneto.com/) in a virtual machine using [Vagrant](https://www.vagrantup.com/). The wiki configurations as well as the actual content are located on the host system and linked into the container.

## Prerequisites

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)

## Starting server

```
host> vagrant up
host> vagrant ssh

client$ cd Raneto-*
client$ npm start
```

Open host browser and visit URL [http://127.0.0.1:8080](http://127.0.0.1:8080).

## Destroying the VM

```
host> vagrant destroy -f
```

## Configuration

The main Raneto configuration file is `config.defaults.js`. It is located in folder `wiki-configs`. During bootstrapping of the Vagrant container the file is copied to `Raneto-0.9.0/example`.

The content is located in folder `wiki-content`. During bootstrapping the content is linked to `Raneto-0.9.0/example/content`.

After bootstrapping the content of the `example` folder inside the virtual machine container looks like this:
```
vagrant@vagrant-ubuntu-trusty-64:~/Raneto-0.9.0$ ls -al example/
total 28
drwxrwxr-x 3 vagrant vagrant 4096 Feb 19 06:50 .
drwxrwxr-x 7 vagrant vagrant 4096 Feb 19 06:49 ..
-rw-r--r-- 1 vagrant vagrant 1899 Feb 19 06:50 config.default.js
-rw-rw-r-- 1 vagrant vagrant 1900 Feb 13 18:45 config.default.js.backup
lrwxrwxrwx 1 vagrant vagrant   21 Feb 19 06:50 content -> /vagrant/wiki-content
drwxrwxr-x 7 vagrant vagrant 4096 Feb 13 18:45 content.backup
-rw-rw-r-- 1 vagrant vagrant  351 Feb 13 18:45 package.json
-rwxrwxr-x 1 vagrant vagrant  795 Feb 13 18:45 server.js
```

## Proxy settings

In case you require custom proxy settings ensure to copy the following file to this folder (containing this `README.md` file):

```
.npmrc
.bowerrc
.wgetrc
```

In case you don't have these files yet: Here's a good instruction on how to setup these files [http://digitaldrummerj.me/proxy-configurations/](http://digitaldrummerj.me/proxy-configurations/).
