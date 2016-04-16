The code in this repo is intended to demonstrate a Round Robin load balancer 
configuration using nginx and a go lang web application. This is not intended 
for deployment in a production environment.

Running the vagrant cluster will result in launching a single web node running 
nginx, and will also launch two back-end servers running a very simple go-lang 
app using the net/http package.

The number and ip of nodes in each tier is configured in the `Vagrantfile` in 
the root of the repo. Installation of the packages for nginx and go lang, and 
some basic configuration is performed by recipes in the `app_cluster` cookbook, 
located in the cookbooks directory.

## Prerequisite Applications
This demo was developed on Centos 7 using the following package versions;
* VirtualBox 5.0.14
* vagrant 1.7.4

The equivalent to these two packages on your distribution will need to be installed 
before proceding. This demo also assumes that git and bash are available, and the 
user is on some mainstream Linux OS.

The documentation for installing vagrant is here;
https://docs.vagrantup.com/v2/installation/

The documentation for installing VirtualBox is here;
https://www.virtualbox.org/manual/ch01.html#intro-installing

## Prerequisite vagrant image

The Vagrant configuration requires the ubuntu/trusty64 vagrant box, and this can 
be installed using the following command

```
$ vagrant box add ubuntu/trusty64
```

## Obtain a local copy of this repository
You can checkout this repository using the following command;

```
$ git clone https://github.com/JPalmerGithub/exercise
```

## Start the vagrant exercise cluster

```
$ cd exercise
$ vagrant up
```

Wait until the vagrant file has reported that the instances have come up

## Access the load balanced example application
Then the load balancer instance can be accesed via a port forwarded to the localhost here;

```
http://localhost:28080/
```
You can then use wget or curl to test that the load balancer is in round robin 
configuration;

```
$ for i in {1..10}; do wget -qO- http://localhost:28080; echo; done
Hi there, I'm served from app2!
Hi there, I'm served from app1!
Hi there, I'm served from app2!
Hi there, I'm served from app1!
Hi there, I'm served from app2!
Hi there, I'm served from app1!
Hi there, I'm served from app2!
Hi there, I'm served from app1!
Hi there, I'm served from app2!
Hi there, I'm served from app1!
```

## Shutdown the vagrant cluster
Use the following command to shutdown the 3 notes and remove any local storage they might 
have been using.
```
# vagrant destroy
```

