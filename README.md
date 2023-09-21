# UserDefaultSugar

[![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://opensource.org/licenses/MIT)
[![platform](https://img.shields.io/badge/Platform-iOS%20%7C%20macOS-blue.svg)](https://developer.apple.com/)
[![Lang](https://img.shields.io/badge/Language-Swift%205.0-orange.svg)](https://swift.org/)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift)
[![Tests](https://github.com/eonist/UserDefaultSugar/actions/workflows/Tests.yml/badge.svg)](https://github.com/eonist/UserDefaultSugar/actions/workflows/Tests.yml)
[![codebeat badge](https://codebeat.co/badges/53f9ea75-e563-4331-9247-e3ab24b8d23d)](https://codebeat.co/projects/github-com-eonist-userdefaultsugar-master)

## Overview

UserDefaultSugar is a Swift library that provides a simple and convenient way to work with UserDefaults. It includes extensions for UserDefaults that allow you to easily store and retrieve Codable objects, check if a key exists, and more.

## Usage

To use UserDefaultSugar in your project, simply add the following line to your `Package.swift` file:

```swift
`"github.com/eonist/UserDefaultSugar" branch: "master"`
``` 

Then, import the library in your Swift file:
`import UserDefaultSugar`

You can then use the various extensions provided by the library. For example, to print all data stored in UserDefaults, use:

`UserDefaults.debug()` 

To remove all data stored in UserDefaults, use:

 `UserDefaults.removeAll()`

To check if a key exists in UserDefaults, use:

`let exists = UserDefaults.standard.exists(keyName: "myKey")`

To store a Codable object in UserDefaults, use:

```swift
let myObject = MyObject()
UserDefaults.standard.set(object: myObject, forKey: "myKey")
```

To retrieve a Codable object from UserDefaults, use:

```swift
if let myObject = try? UserDefaults.standard.get(objectType: MyObject.self, forKey: "myKey") {
    // Do something with myObject
}
```

### Blog post about using userDefaults
[http://eon.codes/blog/2018/09/18/userdefaults/](http://eon.codes/blog/2018/09/18/userdefaults/)

### Resources
- [SwiftyUserDefaults](https://github.com/radex/SwiftyUserDefaults) Another popular library for working with UserDefaults in Swift.
- [Share UserDefault between app and extension See for more details:](https://stackoverflow.com/questions/45607903/sharing-userdefaults-between-extensions) A Stack Overflow post that explains how to share UserDefaults between an app and its extensions.  
- [Blog post about using UserDefaults:](https://smashswift.com/how-to-share-user-defaults-with-extensions/)   A blog post that provides an overview of UserDefaults and how to use it in Swift.


### Todo:
- Make examples using UserDefKind
- Make headless xcodeproj?
- Add support for UserDefaults(suiteName: "group.your.bundle.here") etc
- Add Unit-tests
