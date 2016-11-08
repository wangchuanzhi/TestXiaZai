//
//  appView.m
//  下载器进阶版
//
//  Created by Peter Kong on 16/7/14.
//  Copyright © 2016年 CrazyPeter. All rights reserved.
//

#import "appView.h"
#import "DefineHeader.h"

//私有变量的声明
@interface appView ()

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;

@end

@implementation appView


//重写初始化方法
- (instancetype)initWithImage:(NSString *)iconName andAppName:(NSString *)appname{
    if (self = [super init]) {
        //三个控件的初始化放在这里
        [self setupUIWithImage:iconName andAppName:appname];
    }
    return self;
}

- (void)setupUIWithImage:(NSString *)iconName andAppName:(NSString *)appname
{
    
    /*
     17.5    5     45    45
     
     0      5+45+5  80  15
     
     17.5	 70     45   20
     */
    
    
    /*
     写UI注意：
     初始化，坐标内容
     */
    
    /**
     图片
     */
    self.imageView = [[UIImageView alloc]init];
    UIImage *image = [UIImage imageNamed:iconName];
    self.imageView.image = image;
    self.imageView.frame = CGRectMake(17.5, 5, 45, 45);
    [self addSubview:self.imageView];
    
    /**
     name : Label
     */
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 53, 80, 15)];
    self.label.text = appname;
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont systemFontOfSize:13];
    [self addSubview:self.label];
    
    /**
     按钮
     */
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
    [self.button setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
    [self.button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.button.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.button setTitle:@"下载" forState:UIControlStateNormal];
    
    //在不能点击的情况下显示已下载
    [self.button setTitle:@"已下载" forState:UIControlStateDisabled];

    self.button.frame = CGRectMake(17.5, 70, 45, 20);
    [self addSubview:self.button];
}


- (void)clickButton:(UIButton *)btn
{
    //3.检测是否代理成功
    //检测 1._delegate不为空   2.检测代理的方法是否有反应 respondsToSelector
    
    if (_delegate && [_delegate respondsToSelector:@selector(appViewBtnClicked:)]) {
    
        NSLog(@"_delegate - %@",_delegate);
        
        //4.调用代理
        [_delegate appViewBtnClicked:btn];
    }
}


@end
