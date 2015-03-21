vagrant-boxes
=============
[![GitHub tag](http://img.shields.io/github/tag/storax/vagrant-boxes.svg)][tag]
[![Build Status](http://img.shields.io/travis/storax/vagrant-boxes.svg)][travis]

[tag]: https://github.com/storax/vagrant-boxes/tags
[travis]: https://travis-ci.org/storax/vagrant-boxes

vagrant-boxes build with packer
This repository includes the packer templates to build the boxes.
The built boxes are available through 

* [Atlas](https://atlas.hashicorp.com/storax)

Tools
=====

* [vagrant](http://vagrantup.com)
* [packer](http://packer.io)
* [virtualbox](https://www.virtualbox.org/)
* [Thor](http://whatisthor.com/)

Usage
=====

Install the tools above.

The following env vars must be present:
* `PACKER_ATLAS_TOKEN` Atlas API Token

run the following command to build/upload individual boxes:
```
$ bundle exec thor packer:build \
  --atlas_version=1.0.0 \                 # version tag
  --os=ubuntu \                           # os distribution (debian/ubuntu)
  --os_version=14.04.2-server \                   # os version
  --providers=virtualbox # providers to build
```

run the following command to build/upload ALL boxes sequentially:
```
$ ./build_boxes.sh
```

run the following command to delete temporary artifacts
```
$ bundle exec thor packer:clean cache
```

run the following command to delete all local box files
```
$ bundle exec thor packer:clean boxes
```

Boxes
=====

#### Ubuntu 14.04.2 Desktop x86_64

* VirtualBox Guest Additions 4.3.24

| Provider      | URL                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Atlas         | [storax/ubuntu-14.04.2-server-amd64](https://atlas.hashicorp.com/storax/ubuntu-14.04.2-desktop-amd64)                                                                                                                                                                                                                                                                                                                    |

---

Testing
=======

The following Thor tasks are provided for automated testing of the cookbook:

```
$ bundle exec thor list
thor packer:build     # Execute the packer builder
thor packer:clean     # Remove temporary artifacts
thor packer:validate  # Validate all the packer templates
```
