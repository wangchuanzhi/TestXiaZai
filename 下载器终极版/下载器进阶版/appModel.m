//
//  appModel.m
//  下载器进阶版
//
//  Created by Peter Kong on 16/7/14.
//  Copyright © 2016年 CrazyPeter. All rights reserved.
//

#import "appModel.h"

@implementation appModel


////重写初始化方法，把dictionary里面的内容，放到了一个类里面
//- (instancetype)initWithName:(NSString *)name andIcon:(NSString *)icon
//{
//    if (self = [super init]) {
//        _name = name;
//        _icon = icon;
//    }
//    return self;
//}

//注意没有的键值对
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //重写这个方法
}

@end
