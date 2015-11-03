//
//  NewsimageViewController.h
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/24.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface NewsimageViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)NSIndexPath *index;


@end
