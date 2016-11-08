//
//  ViewController.m
//  下载器进阶版
//
//  Created by Peter Kong on 16/7/14.
//  Copyright © 2016年 CrazyPeter. All rights reserved.
//

#import "ViewController.h"
#import "appView.h"
#import "appModel.h"
#import "DefineHeader.h"

/*
 
 MVC
 Model - View - Controller
 模型 - 界面 - 控制器
 
 */

//5.在上级填写代理文件
@interface ViewController ()<appViewDelegate>

@property (nonatomic, strong) UIView *blackMaskView;
@property (nonatomic, strong) UIButton *downloadBtn;
@property (nonatomic, strong) UIButton *tempBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"app" ofType:@"plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    
    CGFloat space = 10;
    CGFloat top = 80;
    CGFloat leftspace = (self.view.frame.size.width - space*2 - 3*80)/2;
    
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 3; j++) {
            
            NSDictionary *dict = arr[i*3+j];
            
            //生成数据模型
            //appModel *am = [[appModel alloc] initWithName:dict[@"icon"] andIcon:dict[@"name"]];
            
            appModel *am = [appModel new];
            
            //kvc
            //key - value - controller
            //自动匹配键值对
            [am setValuesForKeysWithDictionary:dict];
            
            
            //用数据模型赋值
            appView *av = [[appView alloc]initWithImage:am.icon andAppName:am.name];
            //7.添加代理
            av.delegate = self;
            
            av.backgroundColor = [UIColor cyanColor];
            av.frame = CGRectMake(leftspace + j*(80+space), top + i*(95+space), 80, 95);
            [self.view addSubview:av];
        }
    }
}

- (void)addBlackMaskView
{
    //黑色遮罩
    self.blackMaskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.blackMaskView.backgroundColor = [UIColor blackColor];
    self.blackMaskView.alpha = 0.7;
    [self.view addSubview:self.blackMaskView];
    
    //下载button
    self.downloadBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.downloadBtn.frame = self.blackMaskView.bounds;
    [self.downloadBtn setTitle:@"下载结束吧" forState:UIControlStateNormal];
    [self.downloadBtn addTarget:self action:@selector(clickbtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.blackMaskView addSubview:self.downloadBtn];
}

//6.填写代理方法
-(void)appViewBtnClicked:(UIButton *)btn
{
    [self addBlackMaskView];
    //这里btn是appView上的下载按钮
    self.tempBtn = btn;
}

- (void)clickbtn:(UIButton *)btn
{
    NSLog(@"点击了 - 下载结束吧");
    
    //self.blackMaskView.hidden = YES;
    
    //背景消失动画
    [UIView animateWithDuration:1 animations:^{
        
        //动画效果
        //颜色，大小，透明度，位置
        //当aphla = 0的时候，view自动hidden
        
        self.blackMaskView.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        //从父视图上删除
        [self.downloadBtn removeFromSuperview];
        [self.blackMaskView removeFromSuperview];
        
        //按照惯例，加个保险，检测空指针
        if(self.tempBtn != nil){
            
            //设置按钮不可点击
            self.tempBtn.enabled = NO;
            
            //临时指针使用结束后，设置为nil
            self.tempBtn = nil;
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
