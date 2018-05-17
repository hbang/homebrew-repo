# HASHBANG Productions Homebrew Repository
Add the repo to your system with `brew tap hbang/repo`. Then, you can install…

## Formulae
### `deviceconsole`
Watch a connected iOS device or the iOS Simulator's system log. Provides colored output and filtering. From [rpetrich/deviceconsole](https://github.com/rpetrich/deviceconsole), but this formula actually uses [a fork by cbowns](https://github.com/cbowns/deviceconsole) because it has a few more features. Since deviceconsole has never been given proper releases and versions, you must install with `--HEAD`:

```
$ brew install deviceconsole --HEAD
```

### `theos`
Make-based build system for various types of projects, mainly iOS jailbreak projects.

Theos is installed to `/usr/local/opt/theos` (or equivalent for your Homebrew prefix). You may want to create another symlink, for instance, if you previously stored Theos at `/opt/theos`. Make sure you set `$THEOS` in your environment (see `brew info theos` for details).

This formula is an experiment and not officially supported, but still should work no worries.

* `--without-ldid`: Don’t install the recommended ldid dependency.

## License
This repository is released into the [Public Domain](http://unlicense.org/).
