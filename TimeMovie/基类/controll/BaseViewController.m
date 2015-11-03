//
//  BaseViewController.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/19.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseTabBarController.h"
@interface BaseViewController ()
{
    UILabel *_titlelable;
    UIView *_view;
    BOOL _isHiddenTabBar;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置title风格
    _titlelable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    _titlelable.text=self.title;
    _titlelable.textColor=[UIColor whiteColor];
    _titlelable.font=[UIFont systemFontOfSize:20];
    _titlelable.textAlignment=NSTextAlignmentCenter;
    self.navigationItem.titleView=_titlelable;
    
//    _view=[[UIView alloc]initWithFrame:self.view.bounds];
    self. view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    [self.view addSubview:_view];
    
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    // Do any additional setup after loading the view.
}
//title方法
-(void) setTitle:(NSString *)title{
    [super setTitle:title];
    
    _titlelable.text=title;



}
-(void)viewWillAppear:(BOOL)animated{
    if (_isHiddenTabBar) {
        BaseTabBarController *tab=(BaseTabBarController *)self.tabBarController;
        [tab setButtonhidden:YES];
    }
    else{
        BaseTabBarController *tab=(BaseTabBarController *)self.tabBarController;
        [tab setButtonhidden:NO];
    
    
    
    }



}
-(void)viewWillDisappear:(BOOL)animated{
    BaseTabBarController *tab=(BaseTabBarController *)self.tabBarController;
    [tab setButtonhidden:NO];


}
-(void)setHidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed{

    _isHiddenTabBar=hidesBottomBarWhenPushed;


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
