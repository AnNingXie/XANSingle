//
//  XANSingle.h
//  XANSingle
//
//  Created by XAN on 2018/4/17.
//  Copyright © 2018年 xieanning. All rights reserved.
//  单例实现一般方式

#import <Foundation/Foundation.h>

@interface XANSingle : NSObject<NSCopying,NSMutableCopying>

/**
 提供一个类接口供外界访问

 @return 返回一个单例对象
 */
+(instancetype)shareSingle;


@end
