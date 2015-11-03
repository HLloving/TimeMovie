//
//  BaseTabBarController.h
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/19.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabBarController : UITabBarController
@property(nonatomic)UIView *downview;
-(void)setButtonhidden:(BOOL)isHidden;
@end
