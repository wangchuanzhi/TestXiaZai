//
//  appView.h
//  下载器进阶版
//
//  Created by Peter Kong on 16/7/14.
//  Copyright © 2016年 CrazyPeter. All rights reserved.
//

#import <UIKit/UIKit.h>

//delegate - 反向调用,代理

//1.书写代理
@protocol appViewDelegate <NSObject>


//可选的方法
@optional

//必写的方法
@required
- (void)appViewBtnClicked:(UIButton *)btn;

@end



@interface appView : UIView

- (instancetype)initWithImage:(NSString *)iconName andAppName:(NSString *)appname;


/**
 2.书写属性
 nonatomic，weak
 <代理名>
 代理名前添加 id
 */

@property (nonatomic,weak) id<appViewDelegate> delegate;

@end
