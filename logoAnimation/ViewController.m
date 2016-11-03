//
//  ViewController.m
//  logoAnimation
//
//  Created by huangbq on 2016/11/2.
//  Copyright © 2016年 huangbq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createAnimation];
}

- (void)createAnimation
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 画线
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(20, 10)];
    [path addLineToPoint:CGPointMake(0, 20)];
    [path addLineToPoint:CGPointMake(0, 0)];
    
    [path addLineToPoint:CGPointMake(20, 10)];
    [path addLineToPoint:CGPointMake(0, 20)];
    [path addLineToPoint:CGPointMake(0, 0)];
    
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.contentsScale = [UIScreen mainScreen].scale;
    layer.frame = CGRectMake(0.0f, 0.0f, 20.0f, 20.0f);
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.lineCap = kCALineCapRound;
    layer.lineWidth = 5;
    layer.lineJoin = kCALineJoinRound;
    layer.path = path.CGPath;
    
    [self.view.layer addSublayer:layer];
    
    // 计算layer的position
    CGFloat widthDiff = CGRectGetWidth(self.view.bounds) - CGRectGetWidth(layer.bounds);
    CGFloat heightDiff = CGRectGetHeight(self.view.bounds) - CGRectGetHeight(layer.bounds);
//    CGFloat positionX = widthDiff / 2 + CGRectGetWidth(layer.bounds) / 2;
//    CGFloat positionY = heightDiff / 2 + CGRectGetHeight(layer.bounds) / 2;
    CGFloat positionX = CGRectGetWidth(self.view.bounds) - CGRectGetWidth(layer.bounds)/2 - widthDiff/2;
    CGFloat positionY = CGRectGetHeight(self.view.bounds) - CGRectGetHeight(layer.bounds)/2 - heightDiff/2;
    layer.position = CGPointMake(positionX, positionY);
    
    // 动画时间
    NSTimeInterval animationDuration = 1.5;
    
    CAMediaTimingFunction *linearCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = animationDuration;
    animationGroup.repeatCount = INFINITY;
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.timingFunction = linearCurve;
//    animationGroup.beginTime = CACurrentMediaTime() + 1;
    
    // 动画
    CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeStartAnimation.fromValue = @0;
    strokeStartAnimation.toValue = @0.5;
    
    CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.fromValue = @0.4;
    strokeEndAnimation.toValue = @0.9;
    
    animationGroup.animations = @[strokeStartAnimation, strokeEndAnimation];
    [layer addAnimation:animationGroup forKey:@"progress"];
    
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
