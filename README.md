devbox-bookshelf
================

A collection of Chef cookbooks for integration into [Vagrant][vagrant] dev-boxes.

*Currently under heavy development, thus not guarantied to be complete or even
working under all circumstances.*

Targets latest Ubuntu LTS and CentOS.

A generated devbox follows our vagrant pattern "export guest's `/home/vagrant`
via NFS, mount and edit on host."

Usage
-----

* (optional) fork
* checkout
* run `librarian-chef install`
* Create a `Vagrantfile` (either `vagrant init` or rename `Vagrantfile.sample`)
  and edit for your needs. Esp. make sure to:
  * use a sane value for your private network IP. The default value
    `33.33.33.33` might be in use on your system
  * use a correct base-box (`box_url`) which matches your vm-provider (vmware
    fusion/workstation, virtual box, etc.pp.)
* vagrant up [--provider=vmware_fusion]

Box requirements
----------------

Consider using a basebox image created by our
[packer templates][dotless-packer-tpl].

* chef 11.6.0 (via omnibus install)
* [chruby][chruby]
* [ruby-install][ruby-install]


Running Integration Tests
-------------------------

Integration tests will run using opscode [test-kitchen][test-kitchen].
They'll spawn a vmware fusion vagrant box and run some simple (yet not complete)
tests inside the box. Due to the nature of things, this can take quite some time.

To run test, install dependencies first:

```bash
bundle install
```

Run `bundle exec kitchen list` to get a list of available test instances. For
running minimal tests only you may run:

```bash
bundle exec kitchen test "minimal-.*"
```

A test instance is destroyed when tests on this box passed. You may resume a
test by running e.g. `bundle exec kitchen verify "minimal-.*"`.


**Sidenote**

Currently, we are running patched versions of "test-kitchen" and
"kitchen-vagrant" to get SSH agent and environment variable forwards tested.


<!-- Links -->

[vagrant]:            http://vagrantup.com
[dotless-packer-tpl]: https://github.com/dotless-de/packer-templates
[test-kitchen]:       https://github.com/opscode/test-kitchen
[chruby]:             https://github.com/postmodern/chruby
[ruby-install]:       https://github.com/postmodern/ruby-install
