//
//  CinemaTableViewCell.h
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/29.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Cinema;
@class DistricList;
@interface CinemaTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *cinemaName;
@property (strong, nonatomic) IBOutlet UILabel *rating;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UIImageView *iMax;
@property (strong, nonatomic) IBOutlet UILabel *adress;
@property (strong, nonatomic) IBOutlet UIImageView *group;
@property (strong, nonatomic) IBOutlet UIImageView *set;
@property (strong, nonatomic) IBOutlet UIImageView *Mark;
@property (strong,nonatomic) Cinema *cinema;

@end
