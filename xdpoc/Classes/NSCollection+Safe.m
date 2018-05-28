//
//  NSCollection+Safe.m
//  xdpoc
//
//  Created by Wu,Xinting on 2018/5/28.
//

#import "NSCollection+Safe.h"

@implementation NSMutableDictionary (Safe)

- (void)safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey {
    NSAssert(anObject != nil, @"Set nil for aKey in Dictionary");
    if (!anObject) {
        return;
    }
    [self setObject:anObject forKey:aKey];
}

@end


@implementation NSMutableArray (Safe)

- (void)safeAddObject:(id)anObject {
    NSAssert(anObject != nil, @"Add nil to Array");
    if (!anObject) {
        return;
    }
    [self addObject:anObject];
}

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index {
    NSAssert(anObject != nil, @"Insert nil to Array");
    NSAssert(index < self.count, @"Index out of range");
    if (!anObject || index >= self.count) {
        return;
    }
    [self insertObject:anObject atIndex:index];
}

- (void)safeRemoveObject:(id)anObject {
    NSAssert(anObject != nil, @"Remove nil object.");
    if (!anObject) {
        return;
    }
    [self removeObject:anObject];
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index {
    NSAssert(index < self.count, @"Index out of range");
    if (index >= self.count) {
        return;
    }
    [self removeObjectAtIndex:index];
}

- (void)safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    NSAssert(anObject != nil && index < self.count, @"Index out of range or replaced a nil object");
    if (!anObject || index >= self.count) {
        return;
    }
    [self replaceObjectAtIndex:index withObject:anObject];
}

- (id)safeObjectAtIndex:(NSUInteger)index {
    NSAssert(index < self.count, @"Index out of range");
    if (index >= self.count) {
        return nil;
    }
    return [self objectAtIndex:index];
}

@end


@implementation NSMutableSet (Safe)

- (void)safeAddObject:(id)object {
    NSAssert(object != nil, @"Add nil to Set");
    if (!object) {
        return;
    }
    [self addObject:object];
}

@end
