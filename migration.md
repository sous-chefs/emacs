# Migration Guide

## Breaking Change

Moving from the legacy recipe-and-attribute interface to the `emacs_package` custom resource is a
breaking change.

If you are upgrading from an older cookbook release, update every place that still uses
`recipe[emacs]`, `recipe[emacs::default]`, or `node['emacs']['packages']` before you ship the new
version. The custom-resource release removes `recipes/default.rb` and `attributes/default.rb`, so
older wrapper cookbooks and run lists will fail if they are not updated first.

## What operators need to change

Replace this legacy pattern:

```ruby
node.default['emacs']['packages'] = %w(emacs-nox)
include_recipe 'emacs::default'
```

With the custom resource:

```ruby
emacs_package 'default' do
  packages %w(emacs-nox)
end
```

If you previously relied on the cookbook defaults, the minimal replacement is:

```ruby
emacs_package 'default'
```

## Upgrade checklist

* Remove `recipe[emacs]` or `recipe[emacs::default]` from run lists, wrapper cookbooks, and test cookbooks.
* Stop setting `node['emacs']['packages']`; pass package names with the `packages` property instead.
* Verify any platform-specific package overrides are declared explicitly in the resource block before upgrading production nodes.
