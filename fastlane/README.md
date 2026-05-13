fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios check_remote_version

```sh
[bundle exec] fastlane ios check_remote_version
```

Check if local build number is higher than TestFlight

### ios deploy

```sh
[bundle exec] fastlane ios deploy
```

Push a new release build to TestFlight

### ios metadata

```sh
[bundle exec] fastlane ios metadata
```

Update iOS metadata and screenshots

----


## Android

### android check_remote_version

```sh
[bundle exec] fastlane android check_remote_version
```

Check if local build number is higher than Google Play

### android test

```sh
[bundle exec] fastlane android test
```

Runs all the tests

### android deploy

```sh
[bundle exec] fastlane android deploy
```

Deploy a new version to the Google Play

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
