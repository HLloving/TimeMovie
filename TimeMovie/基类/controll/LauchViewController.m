//
//  LauchViewController.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/31.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "LauchViewController.h"

@interface LauchViewController ()

@end

@implementation LauchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidDisappear:(BOOL)animated{
    UIApplication *app=[UIApplication sharedApplication];
    [app setStatusBarHidden:YES];
    



}
-(void)timeAction:(NSTimer *)timer{
    static NSInteger i=0;
    i++;
    UIImageView *imageview=(UIImageView *)[self.view viewWithTag:i];
    imageview.hidden=NO;
    if (i==25) {
        [timer invalidate];
        [self performSelector:@selector(jumpToMainControll) withObject:self afterDelay:0.5];
    }



}
-(void)jumpToMainControll{
    UIStoryboard *stoy=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *viewControll=[stoy instantiateInitialViewController];
    self.view.window.rootViewController=viewControll;
    viewControll.view.transform=CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateWithDuration:0.5 animations:^{
        viewControll.view.transform=CGAffineTransformIdentity;
    
    
    
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
