//
//  GSLNonARCObject.h
//  SingletonDemo
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface GSLNonARCObject : NSObject

@property (class, readonly) GSLNonARCObject *sharedNonARCObject;

- (instancetype)init NS_DESIGNATED_INITIALIZER OBJC_SWIFT_UNAVAILABLE("use 'aClass.shared' instead");

@end

NS_ASSUME_NONNULL_END
