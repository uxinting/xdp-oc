//
//  NSObject+Runtime.h
//  xdpoc
//
//  Created by Wu,Xinting on 2018/5/28.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)

- (void)addProperty:(id)object forKey:(NSString *)aKey;
- (void)setProperty:(id)object forKey:(NSString *)aKey;
- (id)propertyForKey:(NSString *)aKey;

@end
