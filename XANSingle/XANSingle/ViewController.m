//
//  ViewController.m
//  XANSingle
//
//  Created by XAN on 2018/4/18.
//  Copyright © 2018年 xieanning. All rights reserved.
//

#import "ViewController.h"
#import "XANSingle.h"
#import "XANDownLoad.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建对象
    XANSingle *single1=[XANSingle shareSingle];
    XANSingle *single2=[XANSingle shareSingle];
    NSLog(@"single1:%p\nsingle2:%p",single1,single2);
    /*
     single1:0x60000001c410
     single2:0x60000001c410
     single1与single2的地址相同，实现了单例
     */
    
    XANDownLoad *single3=[XANDownLoad shareDownLoad];
    XANDownLoad *single4=[XANDownLoad shareDownLoad];
    NSLog(@"single3:%p\nsingle4:%p",single3,single4);
    /*
     single3:0x604000008140
     single4:0x604000008140
     single3与single4的地址相同，实现了单例
     */
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
