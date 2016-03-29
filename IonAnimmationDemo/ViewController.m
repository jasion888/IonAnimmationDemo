//
//  ViewController.m
//  IonAnimmationDemo
//
//  Created by jasion on 16/3/29.
//  Copyright © 2016年 jasion. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)UIView *ionView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.ionView];
    [self createAnimation];
}

- (void)createAnimation
{
    //创建粒子动画图层
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.frame = CGRectMake(CGRectGetWidth(self.ionView.frame)/2-30/2, CGRectGetHeight(self.ionView.frame)/2-30/2, 30, 30);
    [self.ionView.layer addSublayer:emitterLayer];
    
    //配置粒子动画
    emitterLayer.renderMode = kCAEmitterLayerAdditive;
    emitterLayer.emitterPosition = CGPointMake(CGRectGetWidth(emitterLayer.frame)/2, CGRectGetHeight(emitterLayer.frame)/2);
    
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"lizi.png"].CGImage);
    //每秒钟出现离子的个数
    cell.birthRate = 5;
    //离子的生命周期
    cell.lifetime = 5.0f;
    //离子的颜色
    //cell.color = [UIColor redColor].CGColor;
    cell.alphaSpeed = -0.4;
    cell.velocity = 50;
    cell.velocityRange = 50;
    cell.emissionRange = M_PI*2.0;
    emitterLayer.emitterCells = @[cell];
    
}

- (UIView *)ionView
{
    if (_ionView == nil) {
        _ionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
        _ionView.backgroundColor = [UIColor whiteColor];
        
    }
    return _ionView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
