//
//  ViewController.m
//  starRank
//
//  Created by liuguochao on 16/4/28.
//  Copyright © 2016年 JiHe. All rights reserved.
//

#import "ViewController.h"

#define ScreenW   [UIScreen mainScreen].bounds.size.width
#define ScreenH   [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
{
    UIView *bottomView;
    UIView *clipView;
    UIProgressView *progress;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, ScreenW, 30)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    [self addImageViewWithImage:@"button_star_white" SupView:bottomView];
    
    clipView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 0, 30)];
    clipView.backgroundColor = [UIColor clearColor];
    clipView.clipsToBounds = YES;
    [self.view addSubview:clipView];
    
    [self addImageViewWithImage:@"button_star_red" SupView:clipView];
}

- (void)addImageViewWithImage:(NSString *)image SupView:(UIView *)supView{
    CGFloat margin = (ScreenW - 5 * 24) / 6;
    for (int i = 0; i < 5; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(margin + (margin + 24) * i, 3, 24, 24)];
        imageView.image = [UIImage imageNamed:image];
        [supView addSubview:imageView];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    CGRect clipFrame = clipView.frame;
    clipFrame.size.width = touchPoint.x;
    clipView.frame = clipFrame;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    CGRect clipFrame = clipView.frame;
    clipFrame.size.width = touchPoint.x;
    clipView.frame = clipFrame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
