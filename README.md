# bento-box
A flask developer's box of goodies.

## Vagrant setup
1. make sure you have Vagrant and Virtualbox installed
2. open terminal/cmd in this dir
3. vagrant up

## Putty setup (optional)
1. convert ./.vagrant/machines/default/virtualbox/private_key to putty key (use puttygen)
2. configure putty to use 'vagrant' user, converted private key, port 2222

## Vagrant up gets you...
* centos8
* all rpms updated
* python36 installed
* flask installed
* postgres 12 and postgis 3 installed
* hello world flask app installed and congured in nginx