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

You can get it from your profile page.

run the following command to build/upload individual boxes:
```
$ bundle exec thor packer:build --os=ubunut --os_version=14.04.2-server
```

run the following command to build/upload all boxes:
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

* VirtualBox Guest Additions 4.3.28
* ubuntu-desktop --no-install-recommends
* build-essential
* cmake
* curl
* gcc
* libbz2-dev
* libphonon-dev
* libqt4-dev
* libreadline-dev
* libsqlite3-dev
* libssl-dev
* libxml2-dev
* libxslt1-dev
* llvm
* make
* wget

| Provider      | URL                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Atlas         | [storax/ubuntu-14.04.2-server-amd64](https://atlas.hashicorp.com/storax/ubuntu-14.04.2-server-amd64)                                                                                                                                                                                                                                                                                                                    |

#### Ubuntu 15.04 Desktop x86_64

* VirtualBox Guest Additions 4.3.28
* ubuntu-desktop --no-install-recommends
* build-essential
* cmake
* curl
* gcc
* libbz2-dev
* libphonon-dev
* libqt4-dev
* libreadline-dev
* libsqlite3-dev
* libssl-dev
* libxml2-dev
* libxslt1-dev
* llvm
* make
* wget

| Provider      | URL                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Atlas         | [storax/ubuntu-15.04-desktop-amd64](https://atlas.hashicorp.com/storax/ubuntu-15.04-desktop-amd64)                                                                                                                                                                                                                                                                                                                    |


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

Updating/Creating a new box
===========================

Make sure to update the version of the box for the vagrant-cloud.
Add a new json file (Copy one of the old ones). Update the box name, iso_checksum, iso_url and version.

License and Author
------------------

The original author and license is mentioned below.
I (David Zuber <zuber.david@gmx.de>) created new packer json files, install different software and adjusted the
build scripts/thorfile. So the concept and workflow is still the same but it builds different images.
Thanks to Achim Rosenhagen for this great setup!

Original license:

- Author:: Achim Rosenhagen (<a.rosenhagen@ffuenf.de>)
- Copyright:: 2015, ffuenf

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
