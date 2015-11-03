//
//  BaseTabBarController.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/19.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//
#import "BaseTabBarController.h"
#import "TabBarButton.h"
#import "PrefixHeader.pch"
@interface BaseTabBarController ()
{
   
    UIImageView *_backimage;
    CGFloat _buttonWidth;
    


}
@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden=YES;
    [self _creatTabBar];
    
    
    // Do any additional setup after loading the view.
}
-(void)_creatTabBar{
    //自定义标签栏
    _downview=[[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight-49, kScreenWidth, 49)];
    _downview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_bg_all"]];
    [self.view addSubview:_downview];
    
    _buttonWidth=kScreenWidth/self.viewControllers.count;
    //选中的背景图片
    _backimage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _buttonWidth, 49)];
    _backimage.image=[UIImage imageNamed:@"selectTabbar_bg_all1@2x"];
    [_downview addSubview:_backimage];
    
    
    NSArray *titles=@[@"电影",@"影院",@"TOP",@"新闻",@"更多"];
    NSArray *imageName=@[@"movie_home",@"icon_cinema",@"start_top250",@"msg_new",
                         @"more_setting"];
//添加tabBarbutton
    
    for (int i=0; i<self.viewControllers.count; i++) {
        TabBarButton *button=[[TabBarButton alloc]initWithTitle:titles[i] imageName:imageName[i] frame:CGRectMake(i*_buttonWidth, 0, _buttonWidth, 49)];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag=100+i;
        
        
        [_downview addSubview:button];
    }



}

-(void)buttonAction:(UIButton *)btn{
    NSInteger i=btn.tag-100;
    self.selectedIndex=i;
    [UIView animateWithDuration:.3 animations:^{
        _backimage.frame=CGRectMake(i*_buttonWidth, 0, _buttonWidth, 49);
    
    
    
    }];



}

-(void)setButtonhidden:(BOOL)isHidden{
    _downview.hidden=isHidden;


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
