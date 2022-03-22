# GSLSynthesizeSingleton

[![Build Status](https://travis-ci.com/GyazSquare/GSLSynthesizeSingleton.svg?branch=master)](https://travis-ci.org/GyazSquare/GSLSynthesizeSingleton)

GSLSynthesizeSingleton is a simple macro to synthesize the methods for an Objective-C singleton class.

## Requirements

* Xcode 13.0 or later
* Base SDK: iOS 15 / macOS 11.3 / watchOS 8 / tvOS 15 or later
* Deployment Target: iOS 6.0 / OS X 10.6 / watchOS 2.0 / tvOS 9.0 or later

## Installation

### CocoaPods

Add the pod to your `Podfile`:

```ruby
# ...

pod 'GSLSynthesizeSingleton'
```

Install the pod:

```sh
$ pod install
```

### Source

Check out the source:

```sh
$ git clone https://github.com/GyazSquare/GSLSynthesizeSingleton.git
```

Copy GSLSynthesizeSingleton.h into your project.

## Usage

1. Declare a singleton class property or method in your header file.
2. Add one macro in your source file.

**XYZManager.h**

```objc
@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface XYZManager : NSObject

+ (instancetype)sharedManager;

// ...

@end

NS_ASSUME_NONNULL_END
```

Or if you use the class from Swift, you'd better declare as follows:

```objc
@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface XYZManager : NSObject

@property (class, readonly) XYZManager *sharedManager;

- (instancetype)init NS_DESIGNATED_INITIALIZER OBJC_SWIFT_UNAVAILABLE("use 'aClass.shared' instead");

// ...

@end

NS_ASSUME_NONNULL_END
```

**XYZManager.m**

```objc
#import "GSLSynthesizeSingleton.h"
#import "XYZManager.h"

@implementation XYZManager

GSLSynthesizeSingleton(XYZ, Manager);

- (instancetype)init {
    self = [super init];
    if (self) {
        // ...
    }
    return self;
}

// ...

@end
```

## License

This software is licensed under the MIT License.

See the LICENSE file for details.
