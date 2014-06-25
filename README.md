# Running Symfony Tests In Parallel

This repository aims to reflect code published in an article on the [marmelab's blog](http://marmelab.overblog.com/2013/11/how-to-use-docker-to-run-phpunit-tests-in-parallel.html).

This is a simple Symfony2 project with 2 tests (`DemoControllerTest` & `SecondControllerTest`).

Each one simulate a lot of tests with a pause of 5 seconds.

Running these tests the normal way :
```sh
$ time phpunit -c app/

real	0m10.443s
user	0m0.379s
sys	0m0.050s
```

Running these tests in parallel :
```sh
$ time sh tests.sh

real	0m6.427s
user	0m0.084s
sys	0m0.100s
```

## Why Using Docker To Run Your Tests ?
This example is not explicit, you can run these tests in parallel only with [GNU Parallel](http://www.gnu.org/software/parallel/).

However your tests can use a storage engine, a search index or other dependencies. In this case when you alter data in a test, this data should not be changed in other tests.
Docker allows to run each test in isolated containers so other tests aren't affected.


## Installation

```sh
composer install
```

### Windows/OSX users

[Docker](http://www.docker.io/) only support Linux LXC (for now) so we should run a virtual machine :

```sh
vagrant up
vagrant ssh

cd /vagrant
```

## Running tests

```sh
sh tests.sh
```

