//
//  appModel.h
//  下载器进阶版
//
//  Created by Peter Kong on 16/7/14.
//  Copyright © 2016年 CrazyPeter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface appModel : NSObject

/*
    model ，就是使用nsobject，把数据内容变成它的属性
 */

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;


/**
 model的写法，
 1、设置属性，注意属性要和dictionary的value对应
 2、重写- (void)setValue:(id)value forUndefinedKey:(NSString *)key
 3、调用 setValuesForKeysWithDictionary
 */

@end
