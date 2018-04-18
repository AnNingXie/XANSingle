//
//  XANPCH.h
//  XANSingle
//
//  Created by XAN on 2018/4/17.
//  Copyright © 2018年 xieanning. All rights reserved.
//  单例的宏定义，将单例定义成宏，就可以直接调用 参考XANDownLoad

//单例宏
#define SingleH(name) +(instancetype)share##name;
//条件编译
#if __has_feature(objc_arc)//使用这个宏判断是否是ARC环境
//条件满足是ARC环境
//使用\来连接  这个SingleM就代表后面所有的代码
#define SingleM(name) static id _instance;\
+(instancetype)allocWithZone:(struct _NSZone *)zone{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance=[super allocWithZone:zone];\
});\
return _instance;\
}\
\
+(instancetype)share##name{\
return [[self alloc]init];\
}\
\
-(id)copyWithZone:(NSZone *)zone{\
return _instance;\
}\
\
-(id)mutableCopyWithZone:(NSZone *)zone{\
return _instance;\
}
#else //否则是MRC环境
//使用\来连接  这个SingleM就代表后面所有的代码
#define SingleM(name) static id _instance;\
+(instancetype)allocWithZone:(struct _NSZone *)zone{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance=[super allocWithZone:zone];\
});\
return _instance;\
}\
\
+(instancetype)share##name{\
return [[self alloc]init];\
}\
\
-(id)copyWithZone:(NSZone *)zone{\
return _instance;\
}\
\
-(id)mutableCopyWithZone:(NSZone *)zone{\
return _instance;\
}\
-(oneway void)release{\
\
}\
\
-(instancetype)retain{\
return _instance;\
}\
\
-(NSUInteger)retainCount{\
return MAXFLOAT;\
}\

#endif
