# emacs_package

Install or remove Emacs packages from the platform package manager.

## Actions

| Action     | Description                       |
|------------|-----------------------------------|
| `:install` | Installs Emacs packages (default) |
| `:remove`  | Removes the configured packages   |

## Properties

| Property   | Type          | Default                        | Description                              |
|------------|---------------|--------------------------------|------------------------------------------|
| `packages` | String, Array | Platform-specific package list | Package name or package list to manage   |

Default package mapping:

* Debian/Ubuntu: `emacs-nox`
* Fedora: `emacs-nw`
* Other supported platforms: `emacs`

## Examples

### Install the default package for the current platform

```ruby
emacs_package 'default'
```

### Install explicit packages

```ruby
emacs_package 'default' do
  packages %w(emacs emacs-common-non-dfsg)
end
```

### Remove Emacs

```ruby
emacs_package 'default' do
  action :remove
end
```
