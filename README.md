![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg)
![platform](https://img.shields.io/badge/Platform-iOS-blue.svg)
![platform](https://img.shields.io/badge/Platform-macOS-blue.svg)
![Lang](https://img.shields.io/badge/Language-Swift%205.0-orange.svg)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift)
[![Tests](https://github.com/eonist/UserDefaultSugar/actions/workflows/Tests.yml/badge.svg)](https://github.com/eonist/UserDefaultSugar/actions/workflows/Tests.yml)
[![codebeat badge](https://codebeat.co/badges/53f9ea75-e563-4331-9247-e3ab24b8d23d)](https://codebeat.co/projects/github-com-eonist-userdefaultsugar-master)

# UserDefaultSugar

### What is it
UserDefault sugar

### How do I use it
`UserDefaults.debug()` // Prints all data  
`UserDefaults.removeAll()` // Removes all data

### How can I get it
- SPM: `"github.com/eonist/UserDefaultSugar" branch: "master"`

### Blog post about using userDefaults
[http://eon.codes/blog/2018/09/18/userdefaults/](http://eon.codes/blog/2018/09/18/userdefaults/)

### Resources
- [https://github.com/radex/SwiftyUserDefaults](https://github.com/radex/SwiftyUserDefaults)
- Share UserDefault between app and extension See for more details: https://stackoverflow.com/questions/45607903/sharing-userdefaults-between-extensions and https://smashswift.com/how-to-share-user-defaults-with-extensions/

### Todo:
- Make examples using UserDefKind
- Make headless xcodeproj?
- Add support for UserDefaults(suiteName: "group.your.bundle.here") etc
