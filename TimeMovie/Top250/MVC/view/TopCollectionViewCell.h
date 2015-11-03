//
//  TopCollectionViewCell.h
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/24.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Topmodel.h"
@interface TopCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIView *starview;
@property (strong, nonatomic) IBOutlet UIImageView *topimage;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *rating;
@property (strong ,nonatomic) Topmodel *topmodel;
@property (assign,nonatomic)CGFloat rat;
@property (strong,nonatomic)UIView *gray;
@property (strong,nonatomic)UIView *yellow;
@end
