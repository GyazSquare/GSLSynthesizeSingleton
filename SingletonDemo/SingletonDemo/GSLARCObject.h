//
//  GSLARCObject.h
//  SingletonDemo
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface GSLARCObject : NSObject

@property (class, readonly) GSLARCObject *sharedARCObject;

- (instancetype)init NS_DESIGNATED_INITIALIZER OBJC_SWIFT_UNAVAILABLE("use 'aClass.shared' instead");

@end

NS_ASSUME_NONNULL_END
