//
//  FirstViewController.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/31.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
{
    UIScrollView *_scrollView;


}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatview];
    // Do any additional setup after loading the view.
}
-(void)creatview{
    _scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    _scrollView.contentSize=CGSizeMake(kScreenWidth*5, kScreenHeight);
    _scrollView.pagingEnabled=YES;
    _scrollView.bounces=NO;
    _scrollView.showsHorizontalScrollIndicator=NO;
    for (int i=0; i<5; i++) {
        UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0+i*kScreenWidth, 0, kScreenWidth, kScreenHeight)];
        NSString *imageName=[NSString stringWithFormat:@"guide%d@2x",i+1];
        imageview.image=[UIImage imageNamed:imageName];
        
        
        
        
        NSString *imageName2=[NSString stringWithFormat:@"guideProgress%d@2x",i+1];
        UIImageView *imageview2=[[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/4, kScreenHeight*7/8, 173, 26)];
        
        imageview2.image=[UIImage imageNamed:imageName2];
        
        imageview.userInteractionEnabled=YES;
        if (i==4) {
            UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth/4, kScreenHeight*5/6, 173, 26)];
            button.backgroundColor=[UIColor blueColor];
            button.layer.cornerRadius=5;
            [button setTitle:@"欢迎进入时间电影" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
            [imageview addSubview:button];
        }
        
        [imageview addSubview:imageview2];
        [_scrollView addSubview:imageview];
        
        
        
    }

    [self.view addSubview:_scrollView];




}
-(void)buttonAction{
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
