# emacs cookbook

Install Emacs from the platform package manager with the `emacs_package` custom resource.

## Breaking Change

Upgrading from older versions of this cookbook is a breaking change. The
custom-resource release removes the top-level `recipes/` and `attributes/`
interface, so existing `recipe[emacs]` usage and `node['emacs']['packages']`
attribute overrides are no longer the supported configuration path.

Before promoting this version, update wrapper cookbooks, roles, and Policyfiles
to use the `emacs_package` resource documented in [migration.md](migration.md).

## Requirements

* Chef Infra Client 15.3+

## Supported Platforms

* AlmaLinux 9+
* Debian 12+
* Fedora
* FreeBSD
* Red Hat Enterprise Linux 9+
* Ubuntu 22.04+
* Arch Linux

This cookbook relies on distro package repositories. See [LIMITATIONS.md](LIMITATIONS.md) for
package naming and repository constraints.

## Resource

### `emacs_package`

Installs or removes Emacs packages.

#### Properties

* `packages` - String or Array of package names to manage. Defaults to a platform-specific package list.

Default package mapping:

* Debian/Ubuntu: `emacs-nox`
* Fedora: `emacs-nw`
* Other supported platforms: `emacs`

#### Actions

* `:install` - Install Emacs packages
* `:remove` - Remove Emacs packages

## Usage

Install the default Emacs package for the current platform:

```ruby
emacs_package 'default'
```

Override the package list when a platform uses a different repository layout:

```ruby
emacs_package 'default' do
  packages %w(emacs emacs-common-non-dfsg)
end
```

Remove Emacs packages:

```ruby
emacs_package 'default' do
  action :remove
end
```

For upgrades from the legacy recipe and attribute interface, follow
[migration.md](migration.md).

Resource-specific documentation is available in [documentation/emacs_package.md](documentation/emacs_package.md).

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
