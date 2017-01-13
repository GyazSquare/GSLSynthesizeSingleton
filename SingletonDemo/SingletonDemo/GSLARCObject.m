//
//  GSLARCObject.m
//  SingletonDemo
//

#import "GSLARCObject.h"
#import "GSLSynthesizeSingleton.h"

@implementation GSLARCObject

GSLSynthesizeSingleton(GSL, ARCObject);

- (instancetype)init {
    return [super init];
}

@end
