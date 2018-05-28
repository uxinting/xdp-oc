//
//  NSObject+Runtime.m
//  xdpoc
//
//  Created by Wu,Xinting on 2018/5/28.
//

#import "NSObject+Runtime.h"
#import <objc/runtime.h>

static NSString * key = @"properties-key";
@implementation NSObject (Runtime)

- (NSMutableDictionary *)properties {
    NSMutableDictionary * dic = objc_getAssociatedObject(self, &key);
    if (!dic) {
        dic = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, &key, dic, OBJC_ASSOCIATION_RETAIN);
    }
    return dic;
}

- (void)addProperty:(id)object forKey:(NSString *)aKey {
    NSAssert(object != nil && aKey != nil, @"Runtime Key or Object is Nil");
    if (!object || !aKey) {
        return;
    }
    NSMutableDictionary * mProps = [self properties];
    NSAssert(![mProps.allKeys containsObject:aKey], @"Add repeated key, use setProperty:forKey instead if you want");
    [mProps setObject:object forKey:aKey];
}

- (void)setProperty:(id)object forKey:(NSString *)aKey {
    NSAssert(object != nil && aKey != nil, @"Runtime Key or Object is Nil");
    if (!object || !aKey) {
        return;
    }
    NSMutableDictionary * mProps = [self properties];
    [mProps setObject:object forKey:aKey];
}

- (id)propertyForKey:(NSString *)aKey {
    NSAssert(aKey != nil, @"Nil key for runtime property");
    NSMutableDictionary * mProps = [self properties];
    return [mProps objectForKey:aKey];
}

@end
