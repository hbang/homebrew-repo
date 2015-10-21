# HASHBANG Productions Homebrew Repository
Add the repo to your system with `brew tap hbang/repo`. Then, you can install…

## Formulae
### `deviceconsole`
Watch a connected iOS device or the iOS Simulator's system log. Provides colored output and filtering. From [rpetrich/deviceconsole](https://github.com/rpetrich/deviceconsole), but this formula actually uses [a fork by cbowns](https://github.com/cbowns/deviceconsole) because it has a few more features. Since deviceconsole has never been given proper releases and versions, you must install with `--HEAD`:

```
$ brew install deviceconsole --HEAD
```

### ~~`ldid`~~
**Now in [the main Homebrew repo](https://github.com/Homebrew/homebrew/blob/master/Library/Formula/ldid.rb).**

Link identity editor – allows you to sign or re-sign a binary with a fake code signature (and optional entitlements plist) so it'll run on jailbroken iOS devices, or view the entitlements plist on a binary. From [saurik's Git repo](http://gitweb.saurik.com/ldid.git).

### `theos`
Build system for various types of projects, mainly iOS jailbreak projects. Since Theos has never been given proper releases and versions, you must install with `--HEAD`:

```
$ brew install theos --HEAD
```

A symlink to Theos is installed to `/usr/local/theos` (or equivalent for your Homebrew prefix). You may want to create another symlink, for instance, if you previously stored Theos at /opt/theos.

## License
Licensed under the [WTFPL](http://www.wtfpl.net/about/), version 2. 
