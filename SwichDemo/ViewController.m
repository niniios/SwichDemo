//
//  ViewController.m
//  SwichDemo
//
//  Created by 倪青山 on 16/3/8.
//  Copyright © 2016年 倪青山. All rights reserved.
//

#import "ViewController.h"
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeigth [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()
@property (nonatomic,weak) UIView * downView;
@property (nonatomic,weak) UIView * bgView;
- (IBAction)popup:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UISwitch *popupChange;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popup:(UISwitch *)sender {
    
    if (sender.isOn) {
        
        UIView * downView = [[[NSBundle mainBundle] loadNibNamed:@"popUp" owner:nil options:nil] firstObject];
        //downView.origin = CGPointMake(0, -150);
        downView.center = CGPointMake(kScreenWidth/2, -150);
        [self.view addSubview:downView];
        
        UIView *boldView = (UIView *)[downView viewWithTag:102];
        boldView.layer.cornerRadius = 5;
        self.downView = downView;
        self.downView.hidden = YES;
        
        self.downView.hidden = NO;
        
        UIButton * sureButton = (UIButton *)[downView viewWithTag:100];
        [sureButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        //背景灰色
        UIView * bgView = [[UIView alloc] initWithFrame:self.view.frame];
        bgView.backgroundColor = [UIColor blackColor];
        bgView.alpha = 0.3;
        [self.view addSubview:bgView];
        self.bgView = bgView;
        [self.view bringSubviewToFront:self.downView];
        //下拉动画
        [UIView animateWithDuration:0.2 animations:^{
            self.downView.center =  CGPointMake(kScreenWidth/2, kScreenHeigth/2);
        }];

    }
}

//确认后移除所有view
- (void)buttonAction
{
    [self.bgView removeFromSuperview];
    [self.downView removeFromSuperview];
    self.bgView = nil;
    self.downView = nil;
}
@end
