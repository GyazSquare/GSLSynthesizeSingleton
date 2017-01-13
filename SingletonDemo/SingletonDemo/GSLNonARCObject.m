//
//  GSLNonARCObject.m
//  SingletonDemo
//

#import "GSLNonARCObject.h"
#import "GSLSynthesizeSingleton.h"

@implementation GSLNonARCObject

GSLSynthesizeSingleton(GSL, NonARCObject);

- (instancetype)init {
    return [super init];
}

@end
