//
//  TopMovieTableViewCell.h
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/28.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Topmovie.h"
@interface TopMovieTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameLable;
@property (strong, nonatomic) IBOutlet UILabel *comentLabel;
@property (strong, nonatomic) IBOutlet UIImageView *touxiang;


@property (strong, nonatomic) IBOutlet UIView *bgview;
@property (nonatomic)Topmovie *topMovie;
@end
