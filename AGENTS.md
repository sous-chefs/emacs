# AGENTS.md

## Cookbook Purpose

Provides the emacs_package resource for installing Emacs

## Agent Findings

* This cookbook is in an incremental modernization pass. Preserve existing public recipes and attributes unless a later full migration is explicitly selected.
* Dependency management should use `Policyfile.rb`; do not reintroduce Berkshelf.

## Known Limitations

## Package Availability

GNU Emacs does not publish a separate vendor APT or RPM repository for this cookbook to manage.
This cookbook installs from each platform's standard package repositories.

### APT (Debian/Ubuntu)

* Ubuntu 24.04 LTS publishes `emacs`, `emacs-nox`, and GUI variants from the `emacs` source package.
  The `emacs-nox` package is published for `amd64`, `arm64`, `armhf`, `ppc64el`, `riscv64`, and `s390x`.
* Debian 12 ships `emacs` and `emacs-nox` in the main archive, with newer builds also available from
  `bookworm-backports`.
* The cookbook default for Debian-family platforms is `emacs-nox`, which matches the terminal-first
  package name used by both Debian and Ubuntu.

### DNF/YUM (RHEL family / Fedora)

* Fedora publishes `emacs` plus `emacs-nw`, the terminal-focused subpackage used by this cookbook.
* RHEL 9 compatible repositories publish `emacs`, `emacs-common`, and `emacs-nox`.
  Current EL9 package indexes show builds for at least `x86_64` and `aarch64`.
* This cookbook defaults to `emacs` on RHEL-family platforms because `emacs` is the stable package name
  across those repositories, while Fedora keeps a distinct `emacs-nw` package for terminal-only installs.

### Arch Linux

* Arch Linux publishes both `emacs` and `emacs-nox` in the `extra` repository.
* Current package metadata is published for `x86_64`.

### FreeBSD

* FreeBSD publishes `emacs` packages through the ports tree, with flavors including `emacs`, `emacs-nox`,
  `emacs-canna`, and `emacs-wayland`.
* Current package indexes show `emacs` and `emacs-nox` builds across multiple supported architectures,
  including `aarch64` and `amd64`.
* The legacy `editors/emacs-nox11` path used by the old cookbook is obsolete under the current FreeBSD
  package flavor model.

## Architecture Limitations

* Ubuntu 24.04 has the broadest confirmed architecture coverage in this cookbook's support set.
* EL9-compatible repositories do not use a single vendor index across every downstream clone, so exact
  architecture coverage depends on the enabled repository set on the target node.
* Arch Linux support in this cookbook should be treated as `x86_64` unless distro metadata later expands.
* FreeBSD package names vary by flavor, so callers that need a specific flavor should override `packages`.

## Source/Compiled Installation

This cookbook does not build Emacs from source.

If a platform repository does not provide the desired package variant, set the resource's `packages`
property explicitly instead of expecting the cookbook to compile Emacs.

### Build Dependencies

No source-build path is implemented, so there are no managed compiler or toolchain dependencies in this
cookbook. If source installation is ever added, it will need platform-specific build dependencies and a
separate resource design.

## Known Issues

* Package names differ by platform, so the cookbook uses a small internal mapping and exposes `packages`
  for overrides.
* CI covers Debian, Ubuntu, and AlmaLinux. Arch and FreeBSD package defaults are documented and mapped, but are not exercised in the default Kitchen suite.
