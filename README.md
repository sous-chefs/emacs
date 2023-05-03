# Description

Installs the "emacs" package to install the worlds most flexible, customizable text editor.

## Requirements

## Platform

* Debian/Ubuntu
* Red Hat/CentOS/Scientific/Fedora/Arch
* FreeBSD

Should work on any platform that has a default provider for the `package` resource and a package named `emacs` avaialble in the default package manager repository.

On FreeBSD, Chef version 0.10.6 is required for fixes to the ports package provider.

## Attributes

* `node['emacs']['packages']` - An array of Emacs package names to install. Defaults to the "No X11" name based on platform and falls back to "emacs".

## Recipes

### default

Installs the emacs package.

### Usage

Simply add `recipe[emacs]` to the run list of a base role that gets applied to all systems. Modify the `node['emacs']['packages']` attribute if the default package name for your platform is unavailable or incorrect (see `attributes/default.rb`). You should modify this with an attribute in a role applied to the node. For example:

    name "base"
    description "base role is applied to all nodes"
    run_list("recipe[emacs]")
    default_attributes(
      "emacs" => {
        "packages" => ["emacs-nox"]
      }
    )

As this is an array you can append other emacs-related packages, such as to make configuration modes available.

## Contributors

This project exists thanks to all the people who [contribute.](https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false)

### Backers

Thank you to all our backers!

![https://opencollective.com/sous-chefs#backers](https://opencollective.com/sous-chefs/backers.svg?width=600&avatarHeight=40)

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

![https://opencollective.com/sous-chefs/sponsor/0/website](https://opencollective.com/sous-chefs/sponsor/0/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/1/website](https://opencollective.com/sous-chefs/sponsor/1/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/2/website](https://opencollective.com/sous-chefs/sponsor/2/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/3/website](https://opencollective.com/sous-chefs/sponsor/3/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/4/website](https://opencollective.com/sous-chefs/sponsor/4/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/5/website](https://opencollective.com/sous-chefs/sponsor/5/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/6/website](https://opencollective.com/sous-chefs/sponsor/6/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/7/website](https://opencollective.com/sous-chefs/sponsor/7/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/8/website](https://opencollective.com/sous-chefs/sponsor/8/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/9/website](https://opencollective.com/sous-chefs/sponsor/9/avatar.svg?avatarHeight=100)
