This is a *rough* set of configuration for vagrant to get Ubuntu Oneiric 64 setup with

* all the stuff you need for building PIL
* the system python 2.6
* python2.7 and python 2.7 dev
* a python 2.7 virtualenv named "projectenv" to put your stuff in
* Postgresql 9.1, the dev package for the postgres client, and a postgres superuser named vagrant and a database named vagrant

The goal is to have a reasonably modern VM for developing python software to launch on the cloud, specifically on Heroku.

*Fair warning:*  This needs some testing, as it's really only been tested on my OSX 10.6 laptop. So, if it doesn't work for you, file a bug :)

To get going:

* Install [virtual box](http://www.virtualbox.org/wiki/Downloads) — The base box targets 4.1.8, so you should have that version.
* Install [vagrant](http://vagrantup.com/) following the instructions on the homepage. If you're lucky like me, you'll need to upgrade ruby gems by doing sudo gem update --system
* clone this repo
* run "vagrant up" in the directory you cloned
* enter your password so that NFS will work
* find something else to keep you busy for the next 30-45 minutes
* run "vagrant ssh" when the box is finished setting itself up

TODO:

* Actually setup redis
* Remove svn stuff from [vagrant-python](https://github.com/mattbowen/vagrant-python)
* Set environment variables with DB connection strings, like Heroku
* Add Heroku debs