//
//  NewsTableViewCell.h
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/22.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import <UIKit/UIKit.h>
@class News;
@interface NewsTableViewCell : UITableViewCell
@property(nonatomic)News *news;
@property (strong, nonatomic) IBOutlet UIImageView *imageview;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UIImageView *type;
@property (strong, nonatomic) IBOutlet UILabel *summary;
@end
