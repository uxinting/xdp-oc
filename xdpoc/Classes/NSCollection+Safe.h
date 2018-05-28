//
//  NSCollection+Safe.h
//  xdpoc
//
//  Created by Wu,Xinting on 2018/5/28.
//



@interface NSMutableDictionary (Safe)

- (void)safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey;

@end


@interface NSMutableArray (Safe)

- (void)safeAddObject:(id)anObject;
- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)safeRemoveObjectAtIndex:(NSUInteger)index;
- (void)safeRemoveObject:(id)anObject;
- (void)safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

- (id)safeObjectAtIndex:(NSUInteger)index;

@end


@interface NSMutableSet (Safe)

- (void)safeAddObject:(id)object;

@end
