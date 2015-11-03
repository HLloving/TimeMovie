//
//  MovieCellTableViewCell.h
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/21.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Model;
@interface MovieCellTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *movieImage;
@property (strong, nonatomic) IBOutlet UILabel *movieName;
@property (strong, nonatomic) IBOutlet UIView *start;
@property (strong, nonatomic) IBOutlet UILabel *year;
@property (strong, nonatomic) IBOutlet UILabel *rating;
@property (strong, nonatomic) Model *model;
@end
