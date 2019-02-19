//
//  NSData+WdEncryption.h
//  eShopManager
//
//  Created by liyanbin on 15/9/16.
//  Copyright (c) 2015年 liyanbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (WdEncryption)
- (NSData *)AES256ParmEncryptWithKey:(NSString *)key;   //加密
- (NSData *)AES256ParmDecryptWithKey:(NSString *)key;   //解密
@end
