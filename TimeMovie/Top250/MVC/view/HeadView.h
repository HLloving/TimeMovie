//
//  HeadView.h
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/28.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface HeadView : UIView
@property (strong, nonatomic) IBOutlet UILabel *movieName;
@property (strong, nonatomic) IBOutlet UILabel *director;
@property (strong, nonatomic) IBOutlet UILabel *actor;
@property (strong, nonatomic) IBOutlet UILabel *movieType;
@property (strong, nonatomic) IBOutlet UILabel *year;
@property (strong, nonatomic) IBOutlet UIImageView *movieImage;

@property (strong, nonatomic) IBOutlet UIScrollView *scorll;

@end
