//
//  PosCollectionViewCell.h
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/26.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "startview.h"
#import "Model.h"

@interface PosCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *smallImage;
@property (strong, nonatomic) IBOutlet UIImageView *bigImage;
@property (strong, nonatomic) IBOutlet UILabel *titleC;
@property (strong, nonatomic) IBOutlet UILabel *titleE;
@property (strong, nonatomic) IBOutlet UILabel *year;
@property (strong, nonatomic) IBOutlet startview *starview;
@property ( nonatomic)  Model *model;
-(void)filpCell;
-(void)backCell;
@end
