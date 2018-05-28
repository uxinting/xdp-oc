//
//  NSData+Encrypt.h
//  xdpoc
//
//  Created by Wu,Xinting on 2018/5/28.
//

#import <Foundation/Foundation.h>

@interface NSData (Encrypt)

- (NSString *)MD5;
- (NSString *)SHA1;

- (NSData *)AES256Encrypt:(NSString *)key;
- (NSData *)AES256Decrypt:(NSString *)key;

@end

@interface NSString (Encrypt)

- (NSString *)MD5;
- (NSString *)SHA1;

- (NSData *)AES256Encrypt:(NSString *)key;

@end
