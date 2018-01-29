//
//  ViewController.m
//  YFLUITest
//
//  Created by 杨丰林 on 2018/1/29.
//  Copyright © 2018年 杨丰林. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *theView;
@property (nonatomic, strong) CAGradientLayer *gradientLayer1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //实现背景渐变
    
    //初始化我们需要改变背景色的UIView，并添加在视图上
    self.theView = [[UIImageView alloc]init];
    [self.theView setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    
//    self.theView = [[UIView alloc]init];
    [self.view addSubview:self.theView];
//    [self.theView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).offset(0);
//        make.top.equalTo(self.view).offset(0);
//        make.width.mas_equalTo(320);
//        make.height.mas_equalTo(200);
//    }];
    
    //初始化CAGradientlayer对象，使它的大小为UIView的大小
    self.gradientLayer1  = [CAGradientLayer layer];
    self.gradientLayer1 .frame = self.theView.bounds;
    
    
    //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
    [self.theView.layer addSublayer:self.gradientLayer1 ];
    
    //设置渐变区域的起始和终止位置（范围为0-1）
    self.gradientLayer1 .startPoint = CGPointMake(0, 0);
    self.gradientLayer1 .endPoint = CGPointMake(0, 1);
    
    //设置颜色数组
    self.gradientLayer1 .colors = @[(__bridge id)[UIColor blueColor].CGColor,
                                  (__bridge id)[UIColor redColor].CGColor];
    
    //设置颜色分割点（范围：0-1）
    self.gradientLayer1 .locations = @[@(0.5f), @(1.0f)];
    
    
    
    UIView *tmpView = [[UIView alloc]init];
    //[tmpView setFrame:CGRectMake(40, 20, 40, 40)];
    [tmpView setBackgroundColor:[UIColor grayColor]];
    [self.theView addSubview:tmpView];
    [tmpView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.theView).offset(40);
        make.top.equalTo(self.theView).offset(20);
        make.height.width.mas_equalTo(40);
    }];
    
    UILabel *tmpLabel1 = [[UILabel alloc]init];
    tmpLabel1.text = @"sdjojofdjofjoj";
    tmpLabel1.textColor = [UIColor yellowColor];
    [tmpLabel1 setFrame:CGRectMake(60, 60, 100, 20)];
    [self.theView addSubview:tmpLabel1];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
