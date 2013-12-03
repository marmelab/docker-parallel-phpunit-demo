# Symfony Parallel Tests

This repository aims to reflect code published in an article on the [marmelab's blog](http://marmelab.overblog.com/2013/11/how-to-use-docker-to-run-phpunit-tests-in-parallel.html).

This is a simple Symfony2 project with 2 tests (`DemoControllerTest` & `SecondControllerTest`).
Each one simulate a lots of tests with a pause of 5 seconds.

Running theses tests the normal way :
```sh
$ time phpunit -c app/

real	0m10.443s
user	0m0.379s
sys	0m0.050s
```

Running theses tests in parallel :
```sh
$ time sh tests.sh

real	0m6.427s
user	0m0.084s
sys	0m0.100s
```

## Why using Docker to runs your tests ?
This example is not explicit, you can run theses tests in parallel only with [GNU Parallel](http://www.gnu.org/software/parallel/).

However you tests can use a storage engine, a search index or other dependencies. In this case when you alter data in a test this data should not be changed in other tests.
Docker allows to run each tests in isolated containers so other tests aren't affected.


## Installation

```sh
composer install
```

### Windows/OSX users

[Docker](http://www.docker.io/) only support Linux LXC (for now) so we should run a virtual machine :

```sh
vagrant ssh
vagrant up

cd /vagrant
```

## Running tests

```sh
sh tests.sh
```

