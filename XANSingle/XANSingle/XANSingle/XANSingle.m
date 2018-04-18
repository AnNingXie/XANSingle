//
//  XANSingle.m
//  XANSingle
//
//  Created by XAN on 2018/4/17.
//  Copyright © 2018年 xieanning. All rights reserved.
//

#import "XANSingle.h"

@implementation XANSingle
//提供全局变量
static XANSingle *_instance;

/**
 重写allocWithZone方法

 @param zone 分配的存储空间
 @return <#return value description#>
 */
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;//GCD一次性代码
    dispatch_once(&onceToken, ^{
        _instance=[super allocWithZone:zone];
    });
    return _instance;
}

+(instancetype)shareSingle{
    return [[self alloc]init];//调用alloc的时候会去调用allocWithZone方法
}

//严谨一点实现下面两个方法
-(id)copyWithZone:(NSZone *)zone{
    return _instance;
}

-(id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}

//条件编译
#if __has_feature(objc_arc)//使用这个宏判断是否是ARC环境
//条件满足是ARC环境

#else //否则是MRC环境
//MRC下重写的方法 让他们失效
-(oneway void)release{
    
}

-(instancetype)retain{
    return _instance;
}

-(NSUInteger)retainCount{
    return MAXFLOAT;
}

#endif

@end
