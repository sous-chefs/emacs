# Migration Guide

## Breaking Change

This cookbook migrated from a default recipe plus package-list attributes to a
custom resource. Operators upgrading from older cookbook versions must treat
this as a breaking change: the legacy `recipes/` and `attributes/` interface is
gone, and wrapper cookbooks that still rely on it need to be updated before the
new release is rolled out.

If your existing automation does either of the following, change it to use
`emacs_package` before upgrading:

* `include_recipe 'emacs::default'` or `recipe[emacs]`
* set `node['emacs']['packages']`

## What changed

* `attributes/default.rb` was removed.
* `recipes/default.rb` was removed.
* The public interface is now the `emacs_package` resource.

## How to migrate

Legacy pattern:

```ruby
node.default['emacs']['packages'] = %w(emacs-nox)
include_recipe 'emacs::default'
```

Resource-first pattern:

```ruby
emacs_package 'default'
```

If you need to override the platform default package list:

```ruby
emacs_package 'default' do
  packages %w(emacs emacs-common-non-dfsg)
end
```

## Attribute migration

Move `node['emacs']['packages']` to the resource `packages` property.

## Important note

Default package names are platform-specific. If your old wrapper cookbook depended on a custom package list, pass it explicitly with the resource instead of relying on a node attribute.
